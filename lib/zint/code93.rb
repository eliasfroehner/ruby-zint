module Zint
  # Code 93
  class Code93 < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_CODE93, options: options)
    end
  end
end
