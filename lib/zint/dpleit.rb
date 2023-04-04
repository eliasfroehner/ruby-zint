module Zint
  class Dpleit < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_DPLEIT, options: options)
    end
  end
end
