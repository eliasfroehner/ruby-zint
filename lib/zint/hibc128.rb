module Zint
  class Hibc128 < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_HIBC_128, options: options)
    end
  end
end
