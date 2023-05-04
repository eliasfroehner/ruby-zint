module Zint
  # Aztec Runes
  class Azrune < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_AZRUNE, **kwargs)
    end
  end
end
