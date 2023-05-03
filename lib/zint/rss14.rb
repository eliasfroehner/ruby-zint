module Zint
  # Legacy
  class Rss14 < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_RSS14, options: options)
    end
  end
end
