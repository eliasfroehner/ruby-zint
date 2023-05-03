module Zint
  # ITF-14
  class Itf14 < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_ITF14, options: options)
    end
  end
end
