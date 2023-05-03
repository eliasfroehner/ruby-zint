module Zint
  module Constants
    # Output options (`symbol->output_options`)
    module OutputOptions
      BARCODE_BIND_TOP = 0x0001 # Boundary bar above the symbol only (not below), does not affect stacking */
      BARCODE_BIND = 0x0002 # Boundary bars above & below the symbol and between stacked symbols */
      BARCODE_BOX = 0x0004 # Box around symbol */
      BARCODE_STDOUT = 0x0008 # Output to stdout */
      READER_INIT = 0x0010 # Reader Initialisation (Programming) */
      SMALL_TEXT = 0x0020 # Use smaller font */
      BOLD_TEXT = 0x0040 # Use bold font */
      CMYK_COLOUR = 0x0080 # CMYK colour space (Encapsulated PostScript and TIF) */
      BARCODE_DOTTY_MODE = 0x0100 # Plot a matrix symbol using dots rather than squares */
      GS1_GS_SEPARATOR = 0x0200 # Use GS instead of FNC1 as GS1 separator (Data Matrix) */
      OUT_BUFFER_INTERMEDIATE = 0x0400 # Return ASCII values in bitmap buffer (OUT_BUFFER only) */
      BARCODE_QUIET_ZONES = 0x0800 # Add compliant quiet zones (additional to any specified whitespace); Note: CODE16K, CODE49, CODABLOCKF, ITF14, EAN/UPC have default quiet zones */
      BARCODE_NO_QUIET_ZONES = 0x1000 # Disable quiet zones, notably those with defaults as listed above */
      COMPLIANT_HEIGHT = 0x2000 # Warn if height not compliant and use standard height (if any) as default */
    end
  end
end
