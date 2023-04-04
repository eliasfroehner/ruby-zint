module Zint
  class MicroQr < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_MICROQR, options: options)
    end
  end
end
