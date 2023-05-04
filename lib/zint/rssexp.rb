module Zint
  # Legacy
  class RssExp < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_RSS_EXP, **kwargs)
    end
  end
end
