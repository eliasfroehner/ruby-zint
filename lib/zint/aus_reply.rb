module Zint
  # Australia Post Reply Paid
  class AusReply < Barcode
    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_AUSREPLY, **kwargs)
    end
  end
end
