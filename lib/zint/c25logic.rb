module Zint
  # 2 of 5 Data Logic
  class C25logic < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_C25LOGIC, **kwargs)
    end
  end
end
