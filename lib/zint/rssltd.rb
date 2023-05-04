module Zint
  # Legacy
  class RssLtd < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_RSS_LTD, **kwargs)
    end
  end
end
