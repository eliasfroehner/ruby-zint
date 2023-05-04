module Zint
  # Code 39
  class Code39 < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_CODE39, **kwargs)
    end
  end
end
