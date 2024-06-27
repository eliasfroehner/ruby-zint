module Zint
  module Structs
    class Vector < FFI::Struct
      layout :width, :float, # Width, height of barcode image (including text, whitespace)
        :height, :float,
        :rectangles, VectorRect.by_ref, # Pointer to first rectangle
        :hexagons, VectorHexagon.by_ref, # Pointer to first hexagon
        :strings, VectorString.by_ref, # Pointer to first string
        :circles, VectorCircle.by_ref # Pointer to first circle

      # Height of barcode image (including text, whitespace)
      def height
        self[:height]
      end

      # Width of barcode image (including text, whitespace)
      def width
        self[:width]
      end

      # Calls the given block and passes a {VectorRect} object for each rectangle to be printed.
      def each_rectangle(&block)
        each_vector(:rectangles, &block)
      end

      # Calls the given block and passes a {VectorHexagon} object for each hexagon to be printed.
      def each_hexagon(&block)
        each_vector(:hexagons, &block)
      end

      # Calls the given block and passes a {VectorString} object for each text string to be printed.
      def each_string(&block)
        each_vector(:strings, &block)
      end

      # Calls the given block and passes a {VectorCircle} object for each circle to be printed.
      def each_circle(&block)
        each_vector(:circles, &block)
      end

      private def each_vector(attr)
        return to_enum(:each_vector, attr) unless block_given?

        o = self[attr]
        until o.null?
          # Avoid garbage collection of Vector (and hence Barcode) before Vector*, since all memory is freed by ZBarcode_Delete()
          o.instance_variable_set(:@vector, self)
          yield o
          o = o[:next]
        end
      end
    end
  end
end
