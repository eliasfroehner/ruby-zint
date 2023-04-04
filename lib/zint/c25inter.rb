module Zint
  class C25inter < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_C25INTER, options: options)
    end
  end
end
