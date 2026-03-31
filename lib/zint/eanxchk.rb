module Zint
  # EAN + Check Digit
  #
  # Deprecated class -> use Ean8 or Ean13 instead.
  class EanxChk < Barcode
    called = caller.find do |fn|
      !fn.include?(RbConfig::TOPDIR) && !fn.start_with?(File.expand_path("..", __dir__))
    end
    warn("Zint::EanxChk is deprecated. Please use Ean8 or Ean13 instead! Called from #{called}", category: :deprecated)

    def initialize(value: nil, input_file: nil, **kwargs)
      super(value: value, input_file: input_file, symbology: Zint::BARCODE_EANX_CHK, **kwargs)
    end
  end
end
