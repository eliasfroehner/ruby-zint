module Zint
  # IBM BC412 (SEMI T1-95)
  class Bc412 < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_BC412, **kwargs)
    end
  end
end
