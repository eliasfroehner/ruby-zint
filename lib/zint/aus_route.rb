module Zint
  # Australia Post Routing
  class AusRoute < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_AUSROUTE, options: options)
    end
  end
end
