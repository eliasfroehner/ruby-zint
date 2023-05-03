module Zint
  # Legacy
  class C25matrix < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_C25MATRIX, options: options)
    end
  end
end
