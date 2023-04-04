module Zint
  class Code32 < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_CODE32, options: options)
    end
  end
end
