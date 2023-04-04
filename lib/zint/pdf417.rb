module Zint
  class Pdf417 < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_PDF417, options: options)
    end
  end
end
