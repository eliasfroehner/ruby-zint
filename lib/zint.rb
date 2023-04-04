require "ffi"

require "zint/version"

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
require "zint/structs/circle"
require "zint/structs/hexagon"
require "zint/structs/rect"
require "zint/structs/symbol"
require "zint/structs/vector_string"
require "zint/structs/vector"

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
  autoload :Channel, "zint/channel"
  autoload :Codabar, "zint/codabar"
  autoload :CodablockF, "zint/codablock_f"
  autoload :Code11, "zint/code11"
  autoload :Code128, "zint/code128"
  autoload :Code128b, "zint/code128b"
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
  autoload :UspsImail, "zint/uspsimail"
  autoload :Vin, "zint/vin"

  extend FFI::Library

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

  def self.raise_error(res, text)
    klass = ERROR_CLASS_FOR_RESULT[res.is_a?(Symbol) ? Zint::ERRORS[res] : res]
    raise klass, text
  end

  ffi_lib %w[libzint.so.2.10 zint]

  # Error codes (API return values)
  enum :error_code, [Zint::WARNINGS, Zint::ERRORS].map { |h| h.to_a }.flatten

  # Aliases for better method signatures
  typedef :pointer, :zint_symbol
  typedef :pointer, :filename
  typedef :int32, :length
  typedef :int32, :rotate_angle
  typedef :int32, :symbol_id
  typedef :uint32, :cap_flag
  typedef :string, :source

  # Create and initialize a symbol structure
  attach_function(:ZBarcode_Create, :ZBarcode_Create, [], :zint_symbol)

  # Free any output buffers that may have been created and initialize output fields
  attach_function(:ZBarcode_Clear, :ZBarcode_Clear, [:zint_symbol], :void)

  # Free a symbol structure, including any output buffers
  attach_function(:ZBarcode_Delete, :ZBarcode_Delete, [:zint_symbol], :void)

  # Encode a barcode. If `length` is 0, `source` must be NUL-terminated.
  attach_function(:ZBarcode_Encode, :ZBarcode_Encode, [:zint_symbol, :source, :length], :error_code)

  # Encode a barcode using input data from file `filename`
  attach_function(:ZBarcode_Encode_File, :ZBarcode_Encode_File, [:zint_symbol, :filename], :error_code)

  # Output a previously encoded symbol to file `symbol->outfile`
  attach_function(:ZBarcode_Print, :ZBarcode_Print, [:zint_symbol, :rotate_angle], :error_code)

  # Encode and output a symbol to file `symbol->outfile`
  attach_function(:ZBarcode_Encode_and_Print, :ZBarcode_Encode_and_Print, [:zint_symbol, :source, :length, :rotate_angle], :error_code)

  # Encode a symbol using input data from file `filename` and output to file `symbol->outfile`
  attach_function(:ZBarcode_Encode_File_and_Print, :ZBarcode_Encode_File_and_Print, [:zint_symbol, :filename, :rotate_angle], :error_code)

  # Output a previously encoded symbol to memory as raster (`symbol->bitmap`)
  attach_function(:ZBarcode_Buffer, :ZBarcode_Buffer, [:zint_symbol, :rotate_angle], :error_code)

  # Encode and output a symbol to memory as raster (`symbol->bitmap`)
  attach_function(:ZBarcode_Encode_and_Buffer, :ZBarcode_Encode_and_Buffer, [:zint_symbol, :source, :length, :rotate_angle], :error_code)

  # Encode a symbol using input data from file `filename` and output to memory as raster (`symbol->bitmap`)
  attach_function(:ZBarcode_Encode_File_and_Buffer, :ZBarcode_Encode_File_and_Buffer, [:zint_symbol, :filename, :rotate_angle], :error_code)

  # Output a previously encoded symbol to memory as vector (`symbol->vector`)
  attach_function(:ZBarcode_Buffer_Vector, :ZBarcode_Buffer_Vector, [:zint_symbol, :rotate_angle], :error_code)

  # Encode and output a symbol to memory as vector (`symbol->vector`)
  attach_function(:ZBarcode_Encode_and_Buffer_Vector, :ZBarcode_Encode_and_Buffer_Vector, [:zint_symbol, :source, :length, :rotate_angle], :error_code)

  # Encode a symbol using input data from file `filename` and output to memory as vector (`symbol->vector`)
  attach_function(:ZBarcode_Encode_File_and_Buffer_Vector, :ZBarcode_Encode_File_and_Buffer_Vector, [:zint_symbol, :filename, :rotate_angle], :error_code)

  # Is `symbol_id` a recognized symbology?
  attach_function(:ZBarcode_ValidID, :ZBarcode_ValidID, [:symbol_id], :bool)

  # Return the capability flags for symbology `symbol_id` that match `cap_flag`
  attach_function(:ZBarcode_Cap, :ZBarcode_Cap, [:symbol_id, :cap_flag], :uint32)

  # Return the version of Zint linked to
  attach_function(:ZBarcode_Version, :ZBarcode_Version, [], :int32)

  def self.library_version
    Zint.ZBarcode_Version
  end
end
