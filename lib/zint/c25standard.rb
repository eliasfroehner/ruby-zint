module Zint
  class C25standard < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_C25STANDARD, options: options)
    end
  end
end
