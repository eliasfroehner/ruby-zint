module Zint
  # EAN-14
  class Ean14 < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_EAN14, options: options)
    end
  end
end
