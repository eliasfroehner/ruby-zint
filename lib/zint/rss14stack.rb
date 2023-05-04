module Zint
  # Legacy
  class Rss14stack < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_RSS14STACK, **kwargs)
    end
  end
end
