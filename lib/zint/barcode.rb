module Zint
  # A base class to represent the barcode being encoded
  class Barcode
    # The value of the barcode
    attr_accessor :value
    # The input data file
    attr_accessor :input_file
    # The type of barcode generated (e.g. EAN, UPC, QR Code, Data Matrix, ...)
    attr_reader :type
    # Access for the underlying FFI ManagedStruct of the Zint C struct
    attr_reader :zint_symbol

    def initialize(value: nil, input_file: nil, type: Zint::BARCODE_CODE128, options: {})
      raise ArgumentError, "value or input_file must be given!" if value.empty? && input_file.empty?
      raise ArgumentError, "input_file not found!" if input_file && !File.exist?(input_file)

      @zint_symbol = create_symbol(type)
      options.each do |key, value|
        @zint_symbol[key] = value
      end

      @type = type
      @value = value
      @input_file = input_file
    end

    def type=(type)
      @type = type

      call_function(:ZBarcode_Clear, zint_symbol)

      symbol[:symbology] = type
    end

    def to_file(path:, rotate_angle: 0)
      @zint_symbol[:outfile] = path

      if input_file
        call_function(:ZBarcode_Encode_File_and_Print, zint_symbol, input_file, rotate_angle)
      else
        call_function(:ZBarcode_Encode_and_Print, zint_symbol, value, 0, rotate_angle)
      end
    end

    def to_memory_file(extension: ".png", rotate_angle: 0)
      require "tempfile"
      file = Tempfile.new(["zint", extension])

      to_file(path: file.path, rotate_angle: rotate_angle)

      file.rewind
      buffer = file.read
      file.close
      file.unlink

      buffer
    end

    def to_buffer(rotate_angle: 0)
      @zint_symbol[:output_options] = Zint::OUT_BUFFER_INTERMEDIATE

      if input_file
        call_function(:ZBarcode_Encode_File_and_Buffer, zint_symbol, input_file, rotate_angle)
      else
        call_function(:ZBarcode_Encode_and_Buffer, zint_symbol, value, 0, rotate_angle)
      end

      zint_bitmap = zint_symbol[:bitmap].read_string((zint_symbol[:bitmap_width] * zint_symbol[:bitmap_height]))

      pixels = []
      zint_symbol[:bitmap_height].times do |row|
        zint_symbol[:bitmap_width].times do |column|
          pixel = zint_bitmap.slice!(0, 1)
          colour = if %w[0 1].include?(pixel)
            (pixel == "1") ? "K" : "W"
          else
            pixel
          end
          pixels << BitmapPixel.new(column, row, colour)
        end
      end

      Bitmap.new(zint_symbol[:bitmap_width], zint_symbol[:bitmap_height], pixels)
    end

    def to_vector(rotate_angle: 0)
      if input_file
        call_function(:ZBarcode_Encode_File_and_Buffer_Vector, zint_symbol, input_file, rotate_angle)
      else
        call_function(:ZBarcode_Encode_and_Buffer_Vector, zint_symbol, value, 0, rotate_angle)
      end

      Structs::Vector.new(zint_symbol[:vector])
    end

    private

    def call_function(function_name, *args)
      error_code = Zint.send(function_name.to_s, *args)

      if Zint::ERRORS[error_code]
        Zint.raise_error(error_code, zint_symbol[:errtxt])
      end

      error_code
    end

    def create_symbol(type)
      symbol = Structs::Symbol.new(Zint.ZBarcode_Create)
      symbol[:symbology] = type

      symbol
    end
  end
end
