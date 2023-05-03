module Zint
  # Aztec Runes
  class Azrune < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_AZRUNE, options: options)
    end
  end
end
