module Zint
  # Australia Post Routing
  class AusRoute < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_AUSROUTE, **kwargs)
    end
  end
end
