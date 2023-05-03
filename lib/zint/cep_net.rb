module Zint
  # Brazilian CEPNet Postal Code
  class CepNet < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_CEPNET, options: options)
    end
  end
end
