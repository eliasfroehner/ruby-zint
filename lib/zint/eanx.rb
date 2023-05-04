module Zint
  # EAN (European Article Number)
  class Eanx < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_EANX, **kwargs)
    end
  end
end
