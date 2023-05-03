module Zint
  # Australia Post 4-State Barcode
  class AusPost < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_AUSPOST, options: options)
    end
  end
end
