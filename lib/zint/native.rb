module Zint
  module Native
    extend FFI::Library

    root_path = File.expand_path("../../..", __FILE__)
    prefix = FFI::Platform::LIBPREFIX.empty? ? "lib" : FFI::Platform::LIBPREFIX
    bundled_dll = File.join(root_path, "lib/#{prefix}zint.#{FFI::Platform::LIBSUFFIX}")
    native_gem1 = File.join(root_path, "lib/3.4/libzint.#{RbConfig::CONFIG["DLEXT"]}") # This is where rake-compiler places the file in the gem
    native_gem2 = File.join(root_path, "lib/3.0/libzint.#{RbConfig::CONFIG["DLEXT"]}") # ... for non-ucrt windows builds
    ffi_lib [bundled_dll, native_gem1, native_gem2, "libzint.so.2.15", "libzint", "zint"]

    # Error codes (API return values)
    enum :error_code, [Constants::Warnings::WARNINGS, Constants::Errors::ERRORS].map { |h| h.to_a }.flatten

    # Aliases for better method signatures
    typedef Structs::Symbol.by_ref, :zint_symbol
    typedef :pointer, :filename
    typedef :int32, :length
    typedef :int32, :rotate_angle
    typedef :int32, :symbol_id
    typedef :uint32, :cap_flag
    typedef :pointer, :source

    # Create and initialize a symbol structure
    attach_function(:ZBarcode_Create, [], :zint_symbol, blocking: true)

    # Free any output buffers that may have been created and initialize output fields
    attach_function(:ZBarcode_Clear, [:zint_symbol], :void, blocking: true)

    # Free a symbol structure, including any output buffers
    #
    # For use with ruby's garbage collector ZBarcode_Delete must be called with a plain :pointer and not an :zint_symbol.
    attach_function(:ZBarcode_Delete, [:pointer], :void, blocking: true)

    # Encode a barcode. If `length` is 0, `source` must be NUL-terminated.
    attach_function(:ZBarcode_Encode, [:zint_symbol, :source, :length], :error_code, blocking: true)

    # Encode a barcode using input data from file `filename`
    attach_function(:ZBarcode_Encode_File, [:zint_symbol, :filename], :error_code, blocking: true)

    # Output a previously encoded symbol to file `symbol->outfile`
    attach_function(:ZBarcode_Print, [:zint_symbol, :rotate_angle], :error_code, blocking: true)

    # Encode and output a symbol to file `symbol->outfile`
    attach_function(:ZBarcode_Encode_and_Print, [:zint_symbol, :source, :length, :rotate_angle], :error_code, blocking: true)

    # Encode a symbol using input data from file `filename` and output to file `symbol->outfile`
    attach_function(:ZBarcode_Encode_File_and_Print, [:zint_symbol, :filename, :rotate_angle], :error_code, blocking: true)

    # Output a previously encoded symbol to memory as raster (`symbol->bitmap`)
    attach_function(:ZBarcode_Buffer, [:zint_symbol, :rotate_angle], :error_code, blocking: true)

    # Encode and output a symbol to memory as raster (`symbol->bitmap`)
    attach_function(:ZBarcode_Encode_and_Buffer, [:zint_symbol, :source, :length, :rotate_angle], :error_code, blocking: true)

    # Encode a symbol using input data from file `filename` and output to memory as raster (`symbol->bitmap`)
    attach_function(:ZBarcode_Encode_File_and_Buffer, [:zint_symbol, :filename, :rotate_angle], :error_code, blocking: true)

    # Output a previously encoded symbol to memory as vector (`symbol->vector`)
    attach_function(:ZBarcode_Buffer_Vector, [:zint_symbol, :rotate_angle], :error_code, blocking: true)

    # Encode and output a symbol to memory as vector (`symbol->vector`)
    attach_function(:ZBarcode_Encode_and_Buffer_Vector, [:zint_symbol, :source, :length, :rotate_angle], :error_code, blocking: true)

    # Encode a symbol using input data from file `filename` and output to memory as vector (`symbol->vector`)
    attach_function(:ZBarcode_Encode_File_and_Buffer_Vector, [:zint_symbol, :filename, :rotate_angle], :error_code, blocking: true)

    # ********* Segment support *********
    # int ZBarcode_Encode_Segs(struct zint_symbol *symbol,
    #       const struct zint_seg segs[], const int seg_count);
    attach_function(:ZBarcode_Encode_Segs, [:zint_symbol, :pointer, :int], :error_code, blocking: true)

    # int ZBarcode_Encode_Segs_and_Print(struct zint_symbol *symbol,
    #       const struct zint_seg segs[], const int seg_count, int rotate_angle);
    attach_function(:ZBarcode_Encode_Segs_and_Print, [:zint_symbol, :pointer, :int, :rotate_angle], :error_code, blocking: true)

    # int ZBarcode_Encode_Segs_and_Buffer(struct zint_symbol *symbol,
    #       const struct zint_seg segs[], const int seg_count, int rotate_angle);
    attach_function(:ZBarcode_Encode_Segs_and_Buffer, [:zint_symbol, :pointer, :int, :rotate_angle], :error_code, blocking: true)

    # int ZBarcode_Encode_Segs_and_Buffer_Vector(struct zint_symbol *symbol,
    #       const struct zint_seg segs[], const int seg_count, int rotate_angle);
    attach_function(:ZBarcode_Encode_Segs_and_Buffer_Vector, [:zint_symbol, :pointer, :int, :rotate_angle], :error_code, blocking: true)

    # Is `symbol_id` a recognized symbology?
    attach_function(:ZBarcode_ValidID, [:symbol_id], :bool, blocking: true)

    # Return the capability flags for symbology `symbol_id` that match `cap_flag`
    attach_function(:ZBarcode_Cap, [:symbol_id, :cap_flag], :uint32, blocking: true)

    # Return the version of Zint linked to
    attach_function(:ZBarcode_Version, [], :int32, blocking: true)

    # Raises specific error for API return code
    #
    # @param res [Symbol, Integer] API return code
    # @param text [String] error text
    # @raise [Error]
    def self.raise_error(res, text)
      klass = ERROR_CLASS_FOR_RESULT[res.is_a?(Symbol) ? Zint::ERRORS[res] : res]
      raise klass, text
    end
  end

  private_constant :Native
end
