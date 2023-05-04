module Zint
  # Aztec Code
  class Aztec < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_AZTEC, **kwargs)
    end
  end
end
