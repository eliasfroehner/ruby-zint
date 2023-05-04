module Zint
  # 2 of 5 Standard (Matrix)
  class C25standard < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_C25STANDARD, **kwargs)
    end
  end
end
