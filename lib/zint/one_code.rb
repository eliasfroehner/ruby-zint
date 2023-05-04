module Zint
  # Legacy
  class OneCode < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_ONECODE, **kwargs)
    end
  end
end
