module Zint
  # USPS Intelligent Mail (OneCode)
  class UspsImail < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_USPS_IMAIL, **kwargs)
    end
  end
end
