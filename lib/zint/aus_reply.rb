module Zint
  # Australia Post Reply Paid
  class AusReply < Barcode
    def initialize(value: nil, input_file: nil, options: {})
      super(value: value, input_file: input_file, type: Zint::BARCODE_AUSREPLY, options: options)
    end
  end
end
