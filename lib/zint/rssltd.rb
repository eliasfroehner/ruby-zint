module Zint
  class RssLtd < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_RSS_LTD, options: options)
    end
  end
end
