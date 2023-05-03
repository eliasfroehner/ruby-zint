module Zint
  # USPS PLANET
  class Planet < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_PLANET, options: options)
    end
  end
end
