module Zint
  module Structs
    #  Structured Append info - ignored unless `zint_structapp.count` is set to non-zero value
    class Structapp < FFI::Struct
      layout :index, :int, # Position in Structured Append sequence, 1-based. Must be <= `count`
        :count, :int, # Number of symbols in Structured Append sequence. Set >= 2 to add SA Info
        :id, [:char, 32] # Optional ID to distinguish sequence, ASCII, NUL-terminated unless max 32 long

      # Position in Structured Append sequence, 1-based. Must be <= `count`
      def index
        self[:index]
      end

      # Number of symbols in Structured Append sequence. Set >= 2 to add SA Info
      def count
        self[:count]
      end

      # Optional ID to distinguish sequence, ASCII, NUL-terminated unless max 32 long
      def id
        self[:id]
      end
    end
  end
end
