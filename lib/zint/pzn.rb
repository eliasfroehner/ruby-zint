module Zint
  # Pharmazentralnummer
  class Pzn < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_PZN, **kwargs)
    end
  end
end
