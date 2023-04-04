module Zint
  class PharmaTwo < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_PHARMA_TWO, options: options)
    end
  end
end
