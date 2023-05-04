module Zint
  # Codablock-F
  class CodablockF < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_CODABLOCKF, **kwargs)
    end
  end
end
