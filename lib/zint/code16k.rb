module Zint
  # Code 16k
  class Code16k < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_CODE16K, **kwargs)
    end
  end
end
