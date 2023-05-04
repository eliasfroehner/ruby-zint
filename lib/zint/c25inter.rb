module Zint
  # 2 of 5 Interleaved
  class C25inter < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_C25INTER, **kwargs)
    end
  end
end
