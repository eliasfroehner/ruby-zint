module Zint
  # Base class to represent the barcode
  #
  # @example Create new barcode
  #   barcode = Zint::Barcode.new(value: "Test", symbology: Zint::BARCODE_QRCODE, option_1: 1)
  #   barcode.to_file(path: "qr.png")
  class Barcode
    include Native

    class AlreadyGenerated < Error; end

    # @return [String, NilClass] Content of the barcode
    attr_accessor :value
    # @return [String, NilClass] Path to input file with content of the barcode
    attr_accessor :input_file

    # @param value [String, NilClass] Content of the barcode
    # @param input_file [String, NilClass] Path to input file with content of the barcode
    # @param symbology [Integer] Type of barcode
    # @param kwargs [Hash] Specific options for zint symbol (height, scale, ...)
    def initialize(value: nil, input_file: nil, symbology: Zint::BARCODE_CODE128, **kwargs)
      raise ArgumentError, "value or input_file must be given!" if value&.empty? && input_file&.empty?
      raise ArgumentError, "input_file not found!" if input_file && !File.exist?(input_file)

      @zint_symbol = Native.ZBarcode_Create
      self.symbology = symbology
      kwargs.each do |k, v|
        send(:"#{k}=", v)
      end

      @value = value
      @input_file = input_file
    end

    # Exports barcode to file
    #
    # @param path [String] Path to export file.
    #                      Contains the name of the file to output a resulting barcode symbol to.
    #                      Must end in .png, .gif, .bmp, .emf, .eps, .pcx, .svg, .tif or .txt
    # @param rotate_angle [Integer] Rotate angle in degrees (0, 90, 180, 270)
    def to_file(path:, rotate_angle: 0)
      unless outfile == "out.png"
        raise AlreadyGenerated, "to_file was already executed"
      end
      @zint_symbol[:outfile] = path

      if input_file
        call_function(:ZBarcode_Encode_File_and_Print, @zint_symbol, input_file, rotate_angle)
      else
        call_function(:ZBarcode_Encode_and_Print, @zint_symbol, value, value.bytesize, rotate_angle)
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
      unless @zint_symbol[:bitmap].null?
        raise AlreadyGenerated, "to_vector was already executed"
      end
      @zint_symbol[:output_options] = Zint::OUT_BUFFER_INTERMEDIATE

      if input_file
        call_function(:ZBarcode_Encode_File_and_Buffer, @zint_symbol, input_file, rotate_angle)
      else
        call_function(:ZBarcode_Encode_and_Buffer, @zint_symbol, value, value.bytesize, rotate_angle)
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
      unless @zint_symbol[:vector].pointer.null?
        raise AlreadyGenerated, "to_vector was already executed"
      end
      if input_file
        call_function(:ZBarcode_Encode_File_and_Buffer_Vector, @zint_symbol, input_file, rotate_angle)
      else
        call_function(:ZBarcode_Encode_and_Buffer_Vector, @zint_symbol, value, value.bytesize, rotate_angle)
      end

      v = @zint_symbol[:vector]
      # Avoid garbage collection of Symbol before Vector, since the Vector is also freed by ZBarcode_Delete()
      v.instance_variable_set(:@symbol, @zint_symbol)
      v
    end

    # Free barcode and all memory associated with it.
    #
    # Note: This method is dangerous insofar, that previously exported vectors (by #to_vector ) are no longer usable and any access to them will result in a segfault.
    # It is better to not call this method and leave cleaning up to the garbage collector.
    def free
      @zint_symbol.pointer.free
    end

    # Attributes

    # Gets type of barcode
    def symbology
      @zint_symbol[:symbology]
    end

    # Sets symbol to use (see BARCODE_XXX below)
    #
    # @param type [Integer] Type of barcode
    def symbology=(type)
      @zint_symbol[:symbology] = type
    end

    # Gets height of barcode
    def height
      @zint_symbol[:height]
    end

    # Sets height in X-dimensions (ignored for fixed-width barcodes)
    #
    # @param height [Float] Height of barcode
    def height=(height)
      @zint_symbol[:height] = height
    end

    # Gets scale factor of barcode
    def scale
      @zint_symbol[:scale]
    end

    # Sets scale factor when printing barcode
    #
    # @param scale [Float] Scale of barcode
    def scale=(scale)
      @zint_symbol[:scale] = scale
    end

    # Gets width in X-dimensions of whitespace to left & right of barcode
    def whitespace_width
      @zint_symbol[:whitespace_width]
    end

    # Sets width in X-dimensions of whitespace to left & right of barcode
    #
    # @param whitespace_width [Integer] Whitespace width of barcode
    def whitespace_width=(whitespace_width)
      @zint_symbol[:whitespace_width] = whitespace_width
    end

    # Gets height in X-dimensions of whitespace above & below the barcode
    def whitespace_height
      @zint_symbol[:whitespace_height]
    end

    # Sets height in X-dimensions of whitespace above & below the barcode
    #
    # @param whitespace_height [Integer] Whitespace height of barcode
    def whitespace_height=(whitespace_height)
      @zint_symbol[:whitespace_height] = whitespace_height
    end

    # Gets size of border in X-dimensions
    def border_width
      @zint_symbol[:border_width]
    end

    # Sets size of border in X-dimensions
    #
    # @param border_width [Integer] Border width of barcode
    def border_width=(border_width)
      @zint_symbol[:border_width] = border_width
    end

    # Gets output options of barcode
    def output_options
      @zint_symbol[:output_options]
    end

    # Set various output parameters (bind, box etc, see below) of barcode
    #
    # @param output_options [Integer] Output options of barcode
    def output_options=(output_options)
      @zint_symbol[:output_options] = output_options
    end

    # Gets foreground colour of barcode
    def fgcolour
      @zint_symbol[:fgcolour].to_s
    end

    # Sets foreground as RGB/RGBA hexadecimal string, 6 or 8 characters, NUL-terminated
    #
    # @param fgcolour [String] Foreground colour of barcode
    def fgcolour=(fgcolour)
      @zint_symbol[:fgcolour] = fgcolour
    end

    # Gets background colour of barcode
    def bgcolour
      @zint_symbol[:bgcolour].to_s
    end

    # Sets background as RGB/RGBA hexadecimal string, 6 or 8 characters, NUL-terminated
    #
    # @param bgcolour [String] Background color of barcode
    def bgcolour=(bgcolour)
      @zint_symbol[:bgcolour] = bgcolour
    end

    # Contains the name of the file to output a resulting barcode symbol to.
    #
    # Must end in .png, .gif, .bmp, .emf, .eps, .pcx, .svg, .tif or .txt
    def outfile
      @zint_symbol[:outfile].to_s
    end

    # Gets option 1 of barcode
    def option_1
      @zint_symbol[:option_1]
    end

    # Sets option 1 (symbol-specific options (see "../docs/manual.txt"))
    #
    # @param option_1 [Integer] Option 1 of barcode
    def option_1=(option_1)
      @zint_symbol[:option_1] = option_1
    end

    # Gets option 2 of barcode
    def option_2
      @zint_symbol[:option_2]
    end

    # Sets option 2 (symbol-specific options) of barcode
    #
    # @param option_2 [Integer] Option 2 of barcode
    def option_2=(option_2)
      @zint_symbol[:option_2] = option_2
    end

    # Gets option 3 of barcode
    def option_3
      @zint_symbol[:option_3]
    end

    # Sets option 3 (symbol-specific options) of barcode
    #
    # @param option_3 [Integer] Option 3 of barcode
    def option_3=(option_3)
      @zint_symbol[:option_3] = option_3
    end

    # Gets show_hrt of barcode
    def show_hrt
      @zint_symbol[:show_hrt]
    end

    # Sets show_hrt of barcode
    # show = 1 or hide = 0 Human Readable Text. Default is show (1)
    #
    # @param show_hrt [Integer] show_hrt of barcode
    def show_hrt=(show_hrt)
      @zint_symbol[:show_hrt] = show_hrt
    end

    # Gets font size of barcode
    def fontsize
      @zint_symbol[:fontsize]
    end

    # Sets font size of barcode (Unused)
    #
    # @param fontsize [Integer] Font size of barcode
    def fontsize=(fontsize)
      @zint_symbol[:fontsize] = fontsize
    end

    # Gets input mode of barcode
    def input_mode
      @zint_symbol[:input_mode]
    end

    # Sets encoding of input data (see DATA_MODE etc below). Default DATA_MODE
    #
    # @param input_mode [Integer] Input mode of barcode
    def input_mode=(input_mode)
      @zint_symbol[:input_mode] = input_mode
    end

    # Gets ECI of barcode
    def eci
      @zint_symbol[:eci]
    end

    # Sets extended Channel Interpretation. Default 0 (none)
    #
    # @param eci [Integer] ECI of barcode
    def eci=(eci)
      @zint_symbol[:eci] = eci
    end

    # Gets resolution of output in dots per mm (BMP/EMF/PCX/PNG/TIF only). Default 0 (none)
    def dpmm
      @zint_symbol[:dpmm]
    end

    # Sets resolution of output in dots per mm (BMP/EMF/PCX/PNG/TIF only). Default 0 (none)
    #
    # @param dpmm [Float] Resolution of output in dots per mm
    def dpmm=(dpmm)
      @zint_symbol[:dpmm] = dpmm
    end

    # Gets height in X-dimensions that EAN/UPC guard bars descend. Default 5
    def guard_descent
      @zint_symbol[:guard_descent]
    end

    # Sets height in X-dimensions that EAN/UPC guard bars descend. Default 5
    #
    # @param guard_descent [Float] Height in X-dimensions that EAN/UPC guard bars descend
    def guard_descent=(guard_descent)
      @zint_symbol[:guard_descent] = guard_descent
    end

    # Gets structured append info. Default structapp.count 0 (none)
    def structapp
      @zint_symbol[:structapp]
    end

    # Sets structured append info. Default structapp.count 0 (none)
    #
    # @param structapp [Structs::Structapp] Structured append info
    def structapp=(structapp)
      @zint_symbol[:structapp] = structapp
    end

    # Human Readable Text, which usually consists of input data plus one more check digit. Uses UTF-8 formatting.
    def text
      @zint_symbol[:text].to_s.force_encoding(Encoding::UTF_8)
    end

    # Sets Human Readable Text (if any), UTF-8, NUL-terminated (output only) of barcode
    #
    # @param text [String] Text of barcode
    def text=(text)
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

    # Gets primary message data for more complex symbols
    def primary
      @zint_symbol[:primary].to_s
    end

    # Sets primary message data (MaxiCode, Composite), NUL-terminated of barcode
    #
    # @param primary [String] Primary of barcode
    def primary=(primary)
      @zint_symbol[:primary] = primary
    end

    # Gets encoded data of barcode
    def encoded_data
      @zint_symbol[:encoded_data]
    end

    # Sets encoded data (output only). Allows for rows of 1144 modules of barcode
    #
    # @param encoded_data [String] Encoded data of barcode
    def encoded_data=(encoded_data)
      @zint_symbol[:encoded_data] = encoded_data
    end

    # Gets row height of barcode
    def row_height
      @zint_symbol[:row_height]
    end

    # Gets error message in the event that an error occurred
    def errtxt
      @zint_symbol[:errtxt].to_s.force_encoding(Encoding::UTF_8)
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

    # Sets size of dots used in BARCODE_DOTTY_MODE
    #
    # @param dot_size [Float] Dot size of barcode
    def dot_size=(dot_size)
      @zint_symbol[:dot_size] = dot_size
    end

    # Gets debugging flags
    def debug
      @zint_symbol[:debug]
    end

    # Sets debugging flags
    #
    # @param debug [Integer] Debug level of barcode
    def debug=(debug)
      @zint_symbol[:debug] = debug
    end

    # Gets warn level of barcode
    def warn_level
      @zint_symbol[:warn_level]
    end

    # Sets warn level (affects error/warning value returned by Zint API (see WARN_XXX below)) of barcode
    #
    # @param warn_level [Integer] Warn level of barcode
    def warn_level=(warn_level)
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
  end
end
