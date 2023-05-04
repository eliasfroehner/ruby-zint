module Zint
  # Legacy
  class Pdf417trunc < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_PDF417TRUNC, **kwargs)
    end
  end
end
