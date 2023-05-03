module Zint
  # HIBC Code 39
  class Hibc39 < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_HIBC_39, options: options)
    end
  end
end
