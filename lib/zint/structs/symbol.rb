module Zint
  module Structs
    class Symbol < FFI::ManagedStruct
      layout :symbology, :int, # Symbol to use (see BARCODE_XXX below)
        :height, :float, # Barcode height in X-dimensions (ignored for fixed-width barcodes)
        :scale, :float, # Scale factor when printing barcode, i.e. adjusts X-dimension. Default 1
        :whitespace_width, :int, # Width in X-dimensions of whitespace to left & right of barcode
        :whitespace_height, :int, # Height in X-dimensions of whitespace above & below the barcode
        :border_width, :int, # Size of border in X-dimensions
        :output_options, :int, # Various output parameters (bind, box etc, see below)
        :fgcolour, [:char, 16], # Foreground as RGB/RGBA hexadecimal string, 6 or 8 characters, NUL-terminated
        :bgcolour, [:char, 16], # Background as RGB/RGBA hexadecimal string, 6 or 8 characters, NUL-terminated
        :fgcolor, :pointer, # Pointer to fgcolour (alternate spelling)
        :bgcolor, :pointer, # Pointer to bgcolour (alternate spelling)
        :outfile, [:char, 256], # Name of file to output to, NUL-terminated. Default "out.png" ("out.gif" if NO_PNG)
        :primary, [:char, 128], # Primary message data (MaxiCode, Composite), NUL-terminated
        :option_1, :int, # Symbol-specific options (see "../docs/manual.txt")
        :option_2, :int, # Symbol-specific options
        :option_3, :int, # Symbol-specific options
        :show_hrt, :int, # Show (1) or hide (0) Human Readable Text (HRT). Default 1
        :input_mode, :int, # Encoding of input data (see DATA_MODE etc below). Default DATA_MODE
        :eci, :int, # Extended Channel Interpretation. Default 0 (none)
        :dpmm, :float, # Resolution of output in dots per mm (BMP/EMF/PCX/PNG/TIF only). Default 0 (none)
        :dot_size, :float, # Size of dots used in BARCODE_DOTTY_MODE. Default 0.8
        :text_gap, :float, # float text_gap;     /* Gap between barcode and text (HRT) in X-dimensions. Default 1 */
        :guard_descent, :float, # Height in X-dimensions that EAN/UPC guard bars descend. Default 5
        :structapp, Structapp, # Structured Append info. Default structapp.count 0 (none)
        :warn_level, :int, # Affects error/warning value returned by Zint API (see WARN_XXX below)
        :debug, :int, # Debugging flags
        :text, [:uchar, 256], # Human Readable Text (if any), UTF-8, NUL-terminated (output only)
        :text_length, :int, # int text_length;    /* Length of text in bytes (output only) */
        :rows, :int, # Number of rows used by the symbol (output only)
        :width, :int, # Width of the generated symbol (output only)
        :encoded_data, [:uchar, 200 * 144], # Encoded data (output only). Allows for rows of 1152 modules
        :row_height, [:float, 200], # Heights of rows (output only). Allows for 200 row DotCode
        :errtxt, [:char, 100], # Error message if an error or warning occurs, NUL-terminated (output only)
        :bitmap, :pointer, # Stored bitmap image (raster output only)
        :bitmap_width, :int, # Width of bitmap image (raster output only)
        :bitmap_height, :int, # Height of bitmap image (raster output only)
        :alphamap, :pointer, # Array of alpha values used (raster output only)
        :vector, Vector.by_ref, # Pointer to vector header (vector output only)
        :memfile, :pointer, # unsigned char *memfile; /* Pointer to in-memory file buffer if BARCODE_MEMORY_FILE (output only) */
        :memfile_size, :int # int memfile_size;   /* Length of in-memory file buffer (output only) */

      # Upcomming zint-2.16:
      # struct zint_seg *raw_segs; /* Pointer to array of raw segs if BARCODE_RAW_TEXT (output only) */
      # :raw_segs, Seg.by_ref,
      # int raw_seg_count;  /* Number of `raw_segs` (output only) */
      # :raw_seg_count, :int

      # @private
      def self.release(ptr)
        Native.ZBarcode_Delete(ptr)
      end
    end
  end
end
