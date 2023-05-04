module Zint
  # Code 32
  class Code32 < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_CODE32, **kwargs)
    end
  end
end
