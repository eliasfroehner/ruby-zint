module Zint
  # Codablock-F
  class CodablockF < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_CODABLOCKF, options: options)
    end
  end
end
