module Zint
  class Code39 < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_CODE39, options: options)
    end
  end
end
