module Zint
  # Aztec Code
  class Aztec < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_AZTEC, options: options)
    end
  end
end
