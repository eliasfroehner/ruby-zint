module Zint
  # IBM BC412 (SEMI T1-95)
  class Bc412 < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_BC412, options: options)
    end
  end
end
