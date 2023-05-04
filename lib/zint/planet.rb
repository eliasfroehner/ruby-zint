module Zint
  # USPS PLANET
  class Planet < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_PLANET, **kwargs)
    end
  end
end
