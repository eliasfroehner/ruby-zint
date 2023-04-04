module Zint
  class Dpd < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_DPD, options: options)
    end
  end
end
