module Zint
  class Pdf417trunc < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_PDF417TRUNC, options: options)
    end
  end
end
