module Zint
  # Legacy
  class RssExpstack < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_RSS_EXPSTACK, options: options)
    end
  end
end
