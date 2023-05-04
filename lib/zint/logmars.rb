module Zint
  # LOGMARS
  class Logmars < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_LOGMARS, **kwargs)
    end
  end
end
