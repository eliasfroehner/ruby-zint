module Zint
  # Universal Postal Union S10
  class UpuS10 < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_UPU_S10, options: options)
    end
  end
end
