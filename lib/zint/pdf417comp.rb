module Zint
  class Pdf417comp < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_PDF417COMP, options: options)
    end
  end
end
