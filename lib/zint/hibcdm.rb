module Zint
  # HIBC Data Matrix
  class HibcDm < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_HIBC_DM, options: options)
    end
  end
end
