module Zint
  # EAN-14
  class Ean14 < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_EAN14, **kwargs)
    end
  end
end
