module Zint
  # HIBC Code 39
  class Hibc39 < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_HIBC_39, **kwargs)
    end
  end
end
