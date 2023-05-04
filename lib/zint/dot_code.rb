module Zint
  # DotCode
  class DotCode < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_DOTCODE, **kwargs)
    end
  end
end
