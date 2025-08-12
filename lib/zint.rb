require "ffi"

require "zint/version"
require "zint/dependencies"

# Zint constants
require "zint/constants/capability_flags"
require "zint/constants/debug_flags"
require "zint/constants/errors"
require "zint/constants/input_data_types"
require "zint/constants/output_options"
require "zint/constants/specific_options"
require "zint/constants/symbologies"
require "zint/constants/warn_levels"
require "zint/constants/warnings"

# Zint structs
require "zint/structs/vector_circle"
require "zint/structs/vector_hexagon"
require "zint/structs/vector_rect"
require "zint/structs/vector_string"
require "zint/structs/vector"
require "zint/structs/seg"
require "zint/structs/structapp"
require "zint/structs/symbol"
require "zint/native"

module Zint
  # Zint constants
  include Constants::CapabilityFlags
  include Constants::DebugFlags
  include Constants::Errors
  include Constants::InputDataTypes
  include Constants::OutputOptions
  include Constants::SpecificOptions
  include Constants::Symbologies
  include Constants::WarnLevels
  include Constants::Warnings

  # Barcode
  autoload :Bc412, "zint/bc_412"
  autoload :Bitmap, "zint/bitmap"
  autoload :BitmapPixel, "zint/bitmap_pixel"
  autoload :Barcode, "zint/barcode"
  autoload :AusPost, "zint/aus_post"
  autoload :AusRedirect, "zint/aus_redirect"
  autoload :AusReply, "zint/aus_reply"
  autoload :AusRoute, "zint/aus_route"
  autoload :Azrune, "zint/azrune"
  autoload :Aztec, "zint/aztec"
  autoload :Bind, "zint/bind"
  autoload :Box, "zint/box"
  autoload :C25iata, "zint/c25iata"
  autoload :C25ind, "zint/c25ind"
  autoload :C25inter, "zint/c25inter"
  autoload :C25logic, "zint/c25logic"
  autoload :C25matrix, "zint/c25matrix"
  autoload :C25standard, "zint/c25standard"
  autoload :CepNet, "zint/cep_net"
  autoload :Channel, "zint/channel"
  autoload :Codabar, "zint/codabar"
  autoload :CodablockF, "zint/codablock_f"
  autoload :Code11, "zint/code11"
  autoload :Code128, "zint/code128"
  autoload :Code128AB, "zint/code128ab"
  autoload :Code128B, "zint/code128b"
  autoload :Code16k, "zint/code16k"
  autoload :Code32, "zint/code32"
  autoload :Code39, "zint/code39"
  autoload :Code49, "zint/code49"
  autoload :Code93, "zint/code93"
  autoload :CodeOne, "zint/code_one"
  autoload :Daft, "zint/daft"
  autoload :DataMatrix, "zint/data_matrix"
  autoload :DbarExp, "zint/dbarexp"
  autoload :DbarExpstk, "zint/dbarexpstk"
  autoload :DbarLtd, "zint/dbarltd"
  autoload :DbarOmn, "zint/dbaromn"
  autoload :DbarOmnstk, "zint/dbaromnstk"
  autoload :DbarStk, "zint/dbarstk"
  autoload :DotCode, "zint/dot_code"
  autoload :DottyMode, "zint/dotty_mode"
  autoload :Dpd, "zint/dpd"
  autoload :Dpident, "zint/dpident"
  autoload :Dpleit, "zint/dpleit"
  autoload :Dxfilmedge, "zint/dxfilmedge"
  autoload :Ean128, "zint/ean128"
  autoload :Ean14, "zint/ean14"
  autoload :Eanx, "zint/eanx"
  autoload :EanxChk, "zint/eanxchk"
  autoload :Excode39, "zint/excode39"
  autoload :Fim, "zint/fim"
  autoload :Flat, "zint/flat"
  autoload :GridMatrix, "zint/grid_matrix"
  autoload :Gs1_128, "zint/gs1_128"
  autoload :Hanxin, "zint/hanxin"
  autoload :Hibc128, "zint/hibc128"
  autoload :Hibc39, "zint/hibc39"
  autoload :HibcAztec, "zint/hibcaztec"
  autoload :HibcBlockf, "zint/hibcblockf"
  autoload :HibcDm, "zint/hibcdm"
  autoload :HibcMicpdf, "zint/hibcmicpdf"
  autoload :HibcPdf, "zint/hibcpdf"
  autoload :HibcQr, "zint/hibcqr"
  autoload :Isbnx, "zint/isbnx"
  autoload :Itf14, "zint/itf14"
  autoload :JapanPost, "zint/japan_post"
  autoload :Kix, "zint/kix"
  autoload :KoreaPost, "zint/korea_post"
  autoload :Logmars, "zint/logmars"
  autoload :Mailmark, "zint/mailmark"
  autoload :Mailmark2D, "zint/mailmark_2d"
  autoload :Mailmark4S, "zint/mailmark_4s"
  autoload :MaxiCode, "zint/maxi_code"
  autoload :MicroPdf417, "zint/micro_pdf417"
  autoload :MicroQr, "zint/micro_qr"
  autoload :MsiPlessey, "zint/msiplessey"
  autoload :NoAscii, "zint/noascii"
  autoload :Nve18, "zint/nve18"
  autoload :OneCode, "zint/one_code"
  autoload :Pdf417, "zint/pdf417"
  autoload :Pdf417comp, "zint/pdf417comp"
  autoload :Pdf417trunc, "zint/pdf417trunc"
  autoload :Pharma, "zint/pharma"
  autoload :PharmaTwo, "zint/pharmatwo"
  autoload :Planet, "zint/planet"
  autoload :Plessey, "zint/plessey"
  autoload :Postnet, "zint/postnet"
  autoload :Pzn, "zint/pzn"
  autoload :Qr, "zint/qr"
  autoload :Rmqr, "zint/rmqr"
  autoload :Rss14, "zint/rss14"
  autoload :Rss14stack, "zint/rss14stack"
  autoload :Rss14stackOmni, "zint/rss14stackomni"
  autoload :RssExp, "zint/rssexp"
  autoload :RssExpstack, "zint/rssexpstack"
  autoload :RssLtd, "zint/rssltd"
  autoload :Stdout, "zint/stdout"
  autoload :Telepen, "zint/telepen"
  autoload :TelepenNum, "zint/telepennum"
  autoload :Ultra, "zint/ultra"
  autoload :UpcA, "zint/upc_a"
  autoload :UpcAChk, "zint/upc_a_chk"
  autoload :UpcE, "zint/upc_e"
  autoload :UpcEChk, "zint/upc_e_chk"
  autoload :Upnqr, "zint/upnqr"
  autoload :UpuS10, "zint/upu_s10"
  autoload :UspsImail, "zint/uspsimail"
  autoload :Vin, "zint/vin"

  class Error < StandardError; end

  ERROR_CLASS_FOR_RESULT = {}

  # Define an exception class for each error code
  ERRORS.to_h.each do |k, v|
    klass = Class.new(Error)
    klass.send(:define_method, :code) { v }
    klass_name = k.to_s.split("_").collect(&:capitalize).join
    const_set(klass_name, klass)
    ERROR_CLASS_FOR_RESULT[v] = klass
  end

  # Returns library version of the current zint
  #
  # @return [Integer] library version
  def self.library_version
    Native.ZBarcode_Version
  end
end
