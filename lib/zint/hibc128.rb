module Zint
  # HIBC (Health Industry Barcode) Code 128
  class Hibc128 < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_HIBC_128, **kwargs)
    end
  end
end
