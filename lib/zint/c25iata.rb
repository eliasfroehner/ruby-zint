module Zint
  # 2 of 5 IATA
  class C25iata < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_C25IATA, **kwargs)
    end
  end
end
