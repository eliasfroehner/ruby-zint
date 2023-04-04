module Zint
  class Code128b < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_CODE128B, options: options)
    end
  end
end
