module Zint
  # DAFT Code
  class Daft < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_DAFT, options: options)
    end
  end
end
