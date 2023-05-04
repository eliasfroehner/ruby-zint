module Zint
  # Flattermarken
  class Flat < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_FLAT, **kwargs)
    end
  end
end
