module Zint
  module Constants
    # Errors (API return values)
    module Errors
      ERRORS = {
        error_too_long: 5,
        error_invalid_data: 6,
        error_invalid_check: 7,
        error_invalid_option: 8,
        error_encoding_problem: 9,
        error_file_access: 10,
        error_memory: 11,
        error_file_write: 12,
        error_uses_eci: 13,
        error_noncompliant: 14
      }
    end
  end
end
