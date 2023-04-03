module Zint
  module Constants
    # Input data types (`symbol->input_mode`)
    module InputDataTypes
      DATA_MODE = 0
      UNICODE_MODE = 1
      GS1_MODE = 2
      # The following may be OR-ed with above
      ESCAPE_MODE = 8
      GS1PARENS_MODE = 16
      GS1NOCHECK_MODE = 32
    end
  end
end
