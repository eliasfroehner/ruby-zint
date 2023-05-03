module Zint
  # GS1 DataBar Stacked Omnidirectional
  class DbarOmnstk < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_DBAR_OMNSTK, options: options)
    end
  end
end
