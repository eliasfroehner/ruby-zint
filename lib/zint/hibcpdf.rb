module Zint
  # HIBC PDF417
  class HibcPdf < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_HIBC_PDF, **kwargs)
    end
  end
end
