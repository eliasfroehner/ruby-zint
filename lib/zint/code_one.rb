module Zint
  # Code One
  class CodeOne < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_CODEONE, **kwargs)
    end
  end
end
