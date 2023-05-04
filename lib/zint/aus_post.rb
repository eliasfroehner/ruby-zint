module Zint
  # Australia Post 4-State Barcode
  class AusPost < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_AUSPOST, **kwargs)
    end
  end
end
