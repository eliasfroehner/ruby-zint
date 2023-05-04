module Zint
  # Legacy
  class C25matrix < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_C25MATRIX, **kwargs)
    end
  end
end
