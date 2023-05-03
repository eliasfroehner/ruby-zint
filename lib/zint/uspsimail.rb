module Zint
  # USPS Intelligent Mail (OneCode)
  class UspsImail < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_USPS_IMAIL, options: options)
    end
  end
end
