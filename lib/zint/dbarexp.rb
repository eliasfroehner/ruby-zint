module Zint
  class DbarExp < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_DBAR_EXP, options: options)
    end
  end
end
