module Zint
  # Code One
  class CodeOne < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_CODEONE, options: options)
    end
  end
end
