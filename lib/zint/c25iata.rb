module Zint
  # 2 of 5 IATA
  class C25iata < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_C25IATA, options: options)
    end
  end
end
