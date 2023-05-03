module Zint
  # Legacy
  class RssExp < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_RSS_EXP, options: options)
    end
  end
end
