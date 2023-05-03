module Zint
  # HIBC PDF417
  class HibcPdf < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_HIBC_PDF, options: options)
    end
  end
end
