module Zint
  class DbarOmn < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_DBAR_OMN, options: options)
    end
  end
end
