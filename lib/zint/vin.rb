module Zint
  # Vehicle Identification Number
  class Vin < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_VIN, options: options)
    end
  end
end
