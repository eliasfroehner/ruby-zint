module Zint
  # Code 49
  class Code49 < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_CODE49, **kwargs)
    end
  end
end
