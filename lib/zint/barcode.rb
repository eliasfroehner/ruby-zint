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

      @value = value
      @input_file = input_file
    end

    # Exports barcode to file
    #
    # @param path [String] Path to export file
    # @param rotate_angle [Integer] Rotate angle in degrees (0, 90, 180, 270)
    def to_file(path:, rotate_angle: 0)
      @zint_symbol[:outfile] = path

      if input_file
        call_function(:ZBarcode_Encode_File_and_Print, @zint_symbol, input_file, rotate_angle)
      else
        call_function(:ZBarcode_Encode_and_Print, @zint_symbol, value, 0, rotate_angle)
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
    # @return [String] Exported barcode buffer
    def to_buffer(rotate_angle: 0)
      @zint_symbol[:output_options] = Zint::OUT_BUFFER_INTERMEDIATE

      if input_file
        call_function(:ZBarcode_Encode_File_and_Buffer, @zint_symbol, input_file, rotate_angle)
      else
        call_function(:ZBarcode_Encode_and_Buffer, @zint_symbol, value, 0, rotate_angle)
      end

      @zint_symbol[:bitmap].read_bytes((@zint_symbol[:bitmap_width] * @zint_symbol[:bitmap_height]))
    end

    # Exports barcode to buffer
    #
    # @param rotate_angle [Integer] Rotate angle in degrees (0, 90, 180, 270)
    # @return [Zint::Bitmap] Exported bitmap
    def to_bitmap(rotate_angle: 0)
      zint_bitmap = to_buffer(rotate_angle: rotate_angle)

      pixels = []
      @zint_symbol[:bitmap_height].times do |row|
        @zint_symbol[:bitmap_width].times do |column|
          pixels << BitmapPixel.new(column, row, zint_bitmap[pixels.size])
        end
      end

      Bitmap.new(@zint_symbol[:bitmap_width], @zint_symbol[:bitmap_height], pixels)
    end

    # Exports barcode as Zint vector
    #
    # @param rotate_angle [Integer] Rotate angle in degrees (0, 90, 180, 270)
    # @return [Zint::Structs::Vector] Vector data of barcode
    def to_vector(rotate_angle: 0)
      if input_file
        call_function(:ZBarcode_Encode_File_and_Buffer_Vector, @zint_symbol, input_file, rotate_angle)
      else
        call_function(:ZBarcode_Encode_and_Buffer_Vector, @zint_symbol, value, 0, rotate_angle)
      end

      v = @zint_symbol[:vector]
      # Avoid garbage collection of Symbol before Vector, since the Vector is also freed by ZBarcode_Delete()
      v.instance_variable_set(:@symbol, @zint_symbol)
      v
    end

    # Free barcode and all memory associated with it.
    def free
      @zint_symbol.pointer.free
    end

    # Attributes

    # Gets type of barcode
    def symbology
      @zint_symbol[:symbology]
    end

    # Sets type of barcode
    #
    # @param type [Integer] Type of barcode
    def symbology=(type)
      reset_symbol

      @zint_symbol[:symbology] = type
    end

    # Gets height of barcode
    def height
      @zint_symbol[:height]
    end

    # Sets height of barcode
    #
    # @param height [Float] Height of barcode
    def height=(height)
      reset_symbol

      @zint_symbol[:height] = height
    end

    # Gets scale of barcode
    def scale
      @zint_symbol[:scale]
    end

    # Sets scale of barcode
    #
    # @param scale [Float] Scale of barcode
    def scale=(scale)
      reset_symbol

      @zint_symbol[:scale] = scale
    end

    # Gets whitespace width of barcode
    def whitespace_width
      @zint_symbol[:whitespace_width]
    end

    # Sets whitespace width of barcode
    #
    # @param whitespace width [Integer] Whitespace width of barcode
    def whitespace_width=(whitespace_width)
      reset_symbol

      @zint_symbol[:whitespace_width] = whitespace_width
    end

    # Gets whitespace height of barcode
    def whitespace_height
      @zint_symbol[:whitespace_height]
    end

    # Sets whitespace height of barcode
    #
    # @param whitespace height [Integer] Whitespace height of barcode
    def whitespace_height=(whitespace_height)
      reset_symbol

      @zint_symbol[:whitespace_height] = whitespace_height
    end

    # Gets border width of barcode
    def border_width
      @zint_symbol[:border_width]
    end

    # Sets border width of barcode
    #
    # @param border width [Integer] Border width of barcode
    def border_width=(border_width)
      reset_symbol

      @zint_symbol[:border_width] = border_width
    end

    # Gets output options of barcode
    def output_options
      @zint_symbol[:output_options]
    end

    # Sets output options of barcode
    #
    # @param output options [Integer] Output options of barcode
    def output_options=(output_options)
      reset_symbol

      @zint_symbol[:output_options] = output_options
    end

    # Gets foreground colour of barcode
    def fgcolour
      @zint_symbol[:fgcolour]
    end

    # Sets foreground colour of barcode
    #
    # @param fgcolour [String] Foreground colour of barcode
    def fgcolour=(fgcolour)
      reset_symbol

      @zint_symbol[:fgcolour] = fgcolour
    end

    # Gets background colour of barcode
    def bgcolour
      @zint_symbol[:bgcolour]
    end

    # Sets background colour of barcode
    #
    # @param bgcolour [String] Background color of barcode
    def bgcolour=(bgcolour)
      reset_symbol

      @zint_symbol[:bgcolour] = bgcolour
    end

    # Gets outfile of barcode
    def outfile
      @zint_symbol[:outfile]
    end

    # Gets option 1 of barcode
    def option_1
      @zint_symbol[:option_1]
    end

    # Sets option 1 of barcode
    #
    # @param option_1 [Integer] Option 1 of barcode
    def option_1=(option_1)
      reset_symbol

      @zint_symbol[:option_1] = option_1
    end

    # Gets option 2 of barcode
    def option_2
      @zint_symbol[:option_2]
    end

    # Sets option 2 of barcode
    #
    # @param option 2 [Integer] Option 2 of barcode
    def option_2=(option_2)
      reset_symbol

      @zint_symbol[:option_2] = option_2
    end

    # Gets option 3 of barcode
    def option_3
      @zint_symbol[:option_3]
    end

    # Sets option 3 of barcode
    #
    # @param option 3 [Integer] Option 3 of barcode
    def option_3=(option_3)
      reset_symbol

      @zint_symbol[:option_3] = option_3
    end

    # Gets show_hrt of barcode
    def show_hrt
      @zint_symbol[:show_hrt]
    end

    # Sets show_hrt of barcode
    # Set to 0 to hide text.
    #
    # @param show_hrt [Integer] show_hrt of barcode
    def show_hrt=(show_hrt)
      reset_symbol

      @zint_symbol[:show_hrt] = show_hrt
    end

    # Gets font size of barcode
    def fontsize
      @zint_symbol[:fontsize]
    end

    # Sets font size of barcode
    #
    # @param font size [Integer] Font size of barcode
    def fontsize=(fontsize)
      reset_symbol

      @zint_symbol[:fontsize] = fontsize
    end

    # Gets input mode of barcode
    def input_mode
      @zint_symbol[:input_mode]
    end

    # Sets input mode of barcode
    #
    # @param input_mode [Integer] Input mode of barcode
    def input_mode=(input_mode)
      reset_symbol

      @zint_symbol[:input_mode] = input_mode
    end

    # Gets ECI of barcode
    def eci
      @zint_symbol[:eci]
    end

    # Sets ECI of barcode
    #
    # @param eci [Integer] ECI of barcode
    def eci=(eci)
      reset_symbol

      @zint_symbol[:eci] = eci
    end

    # Gets text of barcode
    def text
      @zint_symbol[:text]
    end

    # Sets text of barcode
    #
    # @param text [String] Text of barcode
    def text=(text)
      reset_symbol

      @zint_symbol[:text] = text
    end

    # Gets rows of barcode
    def rows
      @zint_symbol[:rows]
    end

    # Gets width of barcode
    def width
      @zint_symbol[:width]
    end

    # Gets primary message data for more complex symbols, with a terminating NUL, of barcode
    def primary
      @zint_symbol[:primary]
    end

    # Sets primary message of barcode
    #
    # @param primary [String] Primary of barcode
    def primary=(primary)
      reset_symbol

      @zint_symbol[:primary] = primary
    end

    # Gets encoded_data of barcode
    def encoded_data
      @zint_symbol[:encoded_data]
    end

    # Sets encoded_data of barcode
    #
    # @param encoded_data [String] Encoded data of barcode
    def encoded_data=(encoded_data)
      reset_symbol

      @zint_symbol[:encoded_data] = encoded_data
    end

    # Gets row height of barcode
    def row_height
      @zint_symbol[:row_height]
    end

    # Gets error text of barcode
    def errtxt
      @zint_symbol[:errtxt]
    end

    # Gets bitmap width of barcode
    def bitmap_width
      @zint_symbol[:bitmap_width]
    end

    # Gets bitmap height of barcode
    def bitmap_height
      @zint_symbol[:bitmap_height]
    end

    # Gets bitmap byte length of barcode
    def bitmap_byte_length
      @zint_symbol[:bitmap_byte_length]
    end

    # Gets dot size of barcode
    def dot_size
      @zint_symbol[:dot_size]
    end

    # Sets dot size of barcode
    #
    # @param dot size [Float] Dot size of barcode
    def dot_size=(dot_size)
      reset_symbol

      @zint_symbol[:dot_size] = dot_size
    end

    # Gets debug level of barcode
    def debug
      @zint_symbol[:debug]
    end

    # Sets debug level of barcode
    #
    # @param debug [Integer] Debug level of barcode
    def debug=(debug)
      reset_symbol

      @zint_symbol[:debug] = debug
    end

    # Gets warn level of barcode
    def warn_level
      @zint_symbol[:warn_level]
    end

    # Sets warn level of barcode
    #
    # @param warn_level [Integer] Warn level of barcode
    def warn_level=(warn_level)
      reset_symbol

      @zint_symbol[:warn_level] = warn_level
    end

    private

    def reset_symbol
      call_function(:ZBarcode_Clear, @zint_symbol)
    end

    def call_function(function_name, *args)
      error_code = Native.send(function_name.to_sym, *args)

      if Zint::ERRORS[error_code]
        Native.raise_error(error_code, @zint_symbol[:errtxt])
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
