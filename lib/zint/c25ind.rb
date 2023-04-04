module Zint
  class C25ind < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_C25IND, options: options)
    end
  end
end
