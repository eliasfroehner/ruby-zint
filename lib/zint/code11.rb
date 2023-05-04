module Zint
  # Code 11
  class Code11 < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_CODE11, **kwargs)
    end
  end
end
