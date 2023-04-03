module Zint
  module Constants
    # Output options (`symbol->output_options`)
    module OutputOptions
      BARCODE_NO_ASCII = 1   # Legacy (no-op)
      BARCODE_BIND = 2   # Boundary bars above & below the symbol and between stacked symbols
      BARCODE_BOX = 4   # Box around symbol
      BARCODE_STDOUT = 8   # Output to stdout
      READER_INIT = 16  # Reader Initialisation (Programming)
      SMALL_TEXT = 32  # Use smaller font
      BOLD_TEXT = 64  # Use bold font
      CMYK_COLOUR = 128 # CMYK colour space (Encapsulated PostScript and TIF)
      BARCODE_DOTTY_MODE = 256 # Plot a matrix symbol using dots rather than squares
      GS1_GS_SEPARATOR = 512 # Use GS instead of FNC1 as GS1 separator (Data Matrix)
      OUT_BUFFER_INTERMEDIATE = 1024 # Return ASCII values in bitmap buffer (OUT_BUFFER only)
    end
  end
end
