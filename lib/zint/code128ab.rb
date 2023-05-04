module Zint
  # Code 128 (Suppress Code Set C)
  class Code128AB < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_CODE128AB, **kwargs)
    end
  end
end
