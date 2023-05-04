module Zint
  # Pharmacode Two-Track
  class PharmaTwo < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_PHARMA_TWO, **kwargs)
    end
  end
end
