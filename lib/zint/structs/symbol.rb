module Zint
  module Structs
    class Symbol < FFI::ManagedStruct
      layout :symbology, :int, # Symbol to use (see BARCODE_XXX below)
        :height, :float, # Height in X-dimensions (ignored for fixed-width barcodes)
        :whitespace_width, :int, # Width in X-dimensions of whitespace to left & right of barcode
        :whitespace_height, :int, # Height in X-dimensions of whitespace above & below the barcode
        :border_width, :int, # Size of border in X-dimensions
        :output_options, :int, # Various output parameters (bind, box etc, see below)
        :fgcolour, [:char, 10], # Foreground as RGB/RGBA hexadecimal string, 6 or 8 characters, NUL-terminated
        :bgcolour, [:char, 10], # Background as RGB/RGBA hexadecimal string, 6 or 8 characters, NUL-terminated
        :fgcolor, :pointer, # Pointer to fgcolour (alternate spelling)
        :bgcolor, :pointer, # Pointer to bgcolour (alternate spelling)
        :outfile, [:char, 256], # Name of file to output to, NUL-terminated. Default "out.png" ("out.gif" if NO_PNG)
        :scale, :float, # Scale factor when printing barcode
        :option_1, :int, # Symbol-specific options (see "../docs/manual.txt")
        :option_2, :int, # Symbol-specific options
        :option_3, :int, # Symbol-specific options
        :show_hrt, :int, # Show (1) or hide (0) Human Readable Text. Default 1
        :fontsize, :int, # Unused
        :input_mode, :int, # Encoding of input data (see DATA_MODE etc below). Default DATA_MODE
        :eci, :int, # Extended Channel Interpretation. Default 0 (none)
        :text, [:uchar, 128], # Human Readable Text (if any), UTF-8, NUL-terminated (output only)
        :rows, :int, # Number of rows used by the symbol (output only)
        :width, :int, # Width of the generated symbol (output only)
        :primary, [:char, 128], # Primary message data (MaxiCode, Composite), NUL-terminated
        :encoded_data, [:uchar, 200 * 143], # Encoded data (output only). Allows for rows of 1144 modules
        :row_height, [:float, 200], # Heights of rows (output only). Allows for 200 row DotCode
        :errtxt, [:char, 100], # Error message if an error or warning occurs, NUL-terminated (output only)
        :bitmap, :pointer, # Stored bitmap image (raster output only)
        :bitmap_width, :int, # Width of bitmap image (raster output only)
        :bitmap_height, :int, # Height of bitmap image (raster output only)
        :alphamap, :pointer, # Array of alpha values used (raster output only)
        :bitmap_byte_length, :uchar, # Size of BMP bitmap data (raster output only)
        :dot_size, :float, # Size of dots used in BARCODE_DOTTY_MODE
        :vector, Vector.by_ref, # Pointer to vector header (vector output only)
        :debug, :int, # Debugging flags
        :warn_level, :int # Affects error/warning value returned by Zint API (see WARN_XXX below)

      # @private
      def self.release(ptr)
        Native.ZBarcode_Delete(ptr)
      end
    end
  end
end
