module Zint
  # Pharmacode One-Track
  class Pharma < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_PHARMA, **kwargs)
    end
  end
end
