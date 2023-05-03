module Zint
  module Constants
    # Input data types (`symbol->input_mode`)
    module InputDataTypes
      DATA_MODE = 0 #  Binary
      UNICODE_MODE = 1 #  UTF-8
      GS1_MODE = 2 #  GS1
      ESCAPE_MODE = 0x0008 #  Process escape sequences
      GS1PARENS_MODE = 0x0010 #  Process parentheses as GS1 AI delimiters (instead of square brackets)
      GS1NOCHECK_MODE = 0x0020 #  Do not check validity of GS1 data (except that printable ASCII only)
      HEIGHTPERROW_MODE = 0x0040 #  Interpret `height` as per-row rather than as overall height
      FAST_MODE = 0x0080 #  Use faster if less optimal encodation or other shortcuts if available (affects DATAMATRIX, MICROPDF417, PDF417, QRCODE & UPNQR only)
    end
  end
end
