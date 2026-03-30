module Zint
  # EAN-13 (European Article Number)
  class Ean13 < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_EAN13, **kwargs)
    end
  end
end
