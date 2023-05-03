module Zint
  # UPC-E
  class UpcE < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_UPCE, options: options)
    end
  end
end
