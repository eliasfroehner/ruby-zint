module Zint
  # Legacy
  class Ean128 < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_EAN128, options: options)
    end
  end
end
