module Zint
  class DottyMode < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_DOTTY_MODE, options: options)
    end
  end
end
