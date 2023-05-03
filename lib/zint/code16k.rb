module Zint
  # Code 16k
  class Code16k < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_CODE16K, options: options)
    end
  end
end
