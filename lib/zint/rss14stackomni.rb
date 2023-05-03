module Zint
  # Legacy
  class Rss14stackOmni < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_RSS14STACK_OMNI, options: options)
    end
  end
end
