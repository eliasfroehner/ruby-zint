module Zint
  class C25logic < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_C25LOGIC, options: options)
    end
  end
end
