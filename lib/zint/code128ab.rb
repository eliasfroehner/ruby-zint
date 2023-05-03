module Zint
  # Code 128 (Suppress Code Set C)
  class Code128AB < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_CODE128AB, options: options)
    end
  end
end
