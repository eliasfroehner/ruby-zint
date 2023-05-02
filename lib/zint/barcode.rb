module Zint
  # Base class to represent the barcode
  #
  # @example Create new barcode
  #   barcode = Zint::Barcode.new(value: "Test", type: Zint::BARCODE_QRCODE, options: {option_1: 1})
  #   barcode.to_file(path: "qr.png")
  class Barcode
    include Native

    # @return [String, NilClass] Content of the barcode
    attr_accessor :value
    # @return [String, NilClass] Path to input file with content of the barcode
    attr_accessor :input_file
    # @return [Integer] Type of barcode
    attr_reader :type
    # @return [Zint::Structs::Symbol] The underlying FFI struct of the Zint C struct
    attr_reader :zint_symbol

    # @param value [String, NilClass] Content of the barcode
    # @param input_file [String, NilClass] Path to input file with content of the barcode
    # @param type [Integer] Type of barcode
    # @param options [Hash] Specific options for Zint symbol
    def initialize(value: nil, input_file: nil, type: Zint::BARCODE_CODE128, options: {})
      raise ArgumentError, "value or input_file must be given!" if value&.empty? && input_file&.empty?
      raise ArgumentError, "input_file not found!" if input_file && !File.exist?(input_file)

      @zint_symbol = create_symbol(type)
      options.each do |key, value|
        @zint_symbol[key] = value
      end

      @type = type
      @value = value
      @input_file = input_file
    end

    # Sets type of barcode
    #
    # @param type [Integer] Type of barcode
    def type=(type)
      @type = type

      call_function(:ZBarcode_Clear, zint_symbol)

      @zint_symbol[:symbology] = type
    end

    # Exports barcode to file
    #
    # @param path [String] Path to export file
    # @param rotate_angle [Integer] Rotate angle in degrees (0, 90, 180, 270)
    def to_file(path:, rotate_angle: 0)
      @zint_symbol[:outfile] = path

      if input_file
        call_function(:ZBarcode_Encode_File_and_Print, zint_symbol, input_file, rotate_angle)
      else
        call_function(:ZBarcode_Encode_and_Print, zint_symbol, value, 0, rotate_angle)
      end
    end

    # Exports barcode to memory file
    #
    # @param extension [String] Extension exported memory file
    # @param rotate_angle [Integer] Rotate angle in degrees (0, 90, 180, 270)
    # @return [String] Exported memory file
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

    # Exports barcode to buffer
    #
    # @param rotate_angle [Integer] Rotate angle in degrees (0, 90, 180, 270)
    # @param raw_bitmap [Boolean] Export raw zint bitmap
    # @return [Zint::Bitmap, String] Exported memory file
    def to_buffer(rotate_angle: 0, raw_bitmap: false)
      @zint_symbol[:output_options] = Zint::OUT_BUFFER_INTERMEDIATE

      if input_file
        call_function(:ZBarcode_Encode_File_and_Buffer, zint_symbol, input_file, rotate_angle)
      else
        call_function(:ZBarcode_Encode_and_Buffer, zint_symbol, value, 0, rotate_angle)
      end

      zint_bitmap = zint_symbol[:bitmap].read_string((zint_symbol[:bitmap_width] * zint_symbol[:bitmap_height]))

      if raw_bitmap
        zint_bitmap
      else
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
    end

    # Exports barcode as Zint vector
    #
    # @param rotate_angle [Integer] Rotate angle in degrees (0, 90, 180, 270)
    # @return [Zint::Structs::Vector] Vector data of barcode
    def to_vector(rotate_angle: 0)
      if input_file
        call_function(:ZBarcode_Encode_File_and_Buffer_Vector, zint_symbol, input_file, rotate_angle)
      else
        call_function(:ZBarcode_Encode_and_Buffer_Vector, zint_symbol, value, 0, rotate_angle)
      end

      v = zint_symbol[:vector]
      # Avoid garbage collection of Symbol before Vector, since the Vector is also freed by ZBarcode_Delete()
      v.instance_variable_set(:@symbol, @zint_symbol)
      v
    end

    # Free barcode and all memory associated with it.
    def free
      @zint_symbol.pointer.free
    end

    private

    def call_function(function_name, *args)
      error_code = Native.send(function_name.to_sym, *args)

      if Zint::ERRORS[error_code]
        Native.raise_error(error_code, zint_symbol[:errtxt])
      end

      error_code
    end

    def create_symbol(type)
      symbol = Native.ZBarcode_Create
      symbol[:symbology] = type

      symbol
    end
  end
end
