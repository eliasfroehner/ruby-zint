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

  # Barcodes
  autoload :Barcode, "zint/barcode"
  autoload :Bitmap, "zint/bitmap"
  autoload :BitmapPixel, "zint/bitmap_pixel"

  extend FFI::Library

  class Error < StandardError; end

  ERROR_CLASS_FOR_RESULT = {}

  # define an exception class for each error code
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
