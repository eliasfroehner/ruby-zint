module Zint
  # EAN-8 (European Article Number)
  class Ean8 < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_EAN8, **kwargs)
    end
  end
end
