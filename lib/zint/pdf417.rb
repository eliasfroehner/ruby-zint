module Zint
  # PDF417
  class Pdf417 < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_PDF417, **kwargs)
    end
  end
end
