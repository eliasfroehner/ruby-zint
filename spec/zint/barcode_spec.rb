module Zint
  RSpec.describe Barcode do
    let(:outfile) { File.join(Dir.tmpdir, "out.svg") }
    let(:buffer_outfile) { File.join(Dir.tmpdir, "buffer.png") }
    let(:input_file) { "spec/fixtures/input_file.txt" }

    let(:barcode) { described_class.new(value: "Test") }
    let(:barcode_with_input_file) { described_class.new(input_file: input_file) }

    describe "exports" do
      after do
        [outfile, buffer_outfile].each do |file|
          File.delete(file) if File.exist?(file)
        end
      end

      it "exports barcode to file from given value" do
        barcode.to_file(path: outfile)

        expect(File.exist?(outfile)).to be true
      end

      it "exports barcode to file from input file" do
        barcode_with_input_file.to_file(path: outfile)

        expect(File.exist?(outfile)).to be true
      end

      it "exports barcode to memory file from given value" do
        svg_file = barcode.to_memory_file(extension: ".svg")

        expect(svg_file.include?("<svg")).to be true
      end

      it "exports barcode to memory file from input file" do
        svg_file = barcode_with_input_file.to_memory_file(extension: ".svg")

        expect(svg_file.include?("<svg")).to be true
      end

      it "exports barcode to bitmap object from given value" do
        require "digest/md5"

        bitmap = barcode.to_bitmap

        require "chunky_png"
        png = ChunkyPNG::Image.new(bitmap.width, bitmap.height, ChunkyPNG::Color::TRANSPARENT)
        white = ChunkyPNG::Color("white")
        black = ChunkyPNG::Color("black")

        bitmap.pixels.each do |pixel|
          png.compose_pixel(pixel.x, pixel.y, (pixel.colour == "1") ? black : white)
        end

        png.save(buffer_outfile)

        expect(Digest::MD5.file(buffer_outfile).hexdigest).to eq Digest::MD5.file("spec/fixtures/buffer.png").hexdigest
      end

      it "exports barcode to bitmap object from input file" do
        require "digest/md5"

        bitmap = barcode_with_input_file.to_bitmap

        require "chunky_png"
        png = ChunkyPNG::Image.new(bitmap.width, bitmap.height, ChunkyPNG::Color::TRANSPARENT)
        white = ChunkyPNG::Color("white")
        black = ChunkyPNG::Color("black")

        bitmap.pixels.each do |pixel|
          png.compose_pixel(pixel.x, pixel.y, (pixel.colour == "1") ? black : white)
        end

        png.save(buffer_outfile)

        expect(Digest::MD5.file(buffer_outfile).hexdigest).to eq Digest::MD5.file("spec/fixtures/buffer_from_input_file.png").hexdigest
      end

      it "exports colored barcode to buffer from value" do
        require "digest/md5"

        bitmap = described_class.new(value: "Test", type: Zint::BARCODE_ULTRA).to_bitmap

        require "chunky_png"
        png = ChunkyPNG::Image.new(bitmap.width, bitmap.height, ChunkyPNG::Color::TRANSPARENT)
        white = ChunkyPNG::Color("white")
        black = ChunkyPNG::Color("black")
        cyan = ChunkyPNG::Color("cyan")
        blue = ChunkyPNG::Color("blue")
        magenta = ChunkyPNG::Color("magenta")
        red = ChunkyPNG::Color("red")
        yellow = ChunkyPNG::Color("yellow")
        green = ChunkyPNG::Color("green")

        bitmap.pixels.each do |pixel|
          colour = case pixel.colour

          when "W"
            white
          when "C"
            cyan
          when "B"
            blue
          when "M"
            magenta
          when "R"
            red
          when "Y"
            yellow
          when "G"
            green
          when "K"
            black
          else
            raise "Invalid color: #{pixel.colour}"
          end
          png.compose_pixel(pixel.x, pixel.y, colour)
        end

        png.save(buffer_outfile)

        expect(Digest::MD5.file(buffer_outfile).hexdigest).to eq Digest::MD5.file("spec/fixtures/colored_buffer.png").hexdigest
      end

      it "exports barcode to zint bitmap" do
        bitmap = barcode.to_buffer

        expected_bitmap = File.read("spec/fixtures/barcode_raw_bitmap.txt")
        expect(bitmap).to eq expected_bitmap
      end

      it "exports barcode as vector from given value" do
        vector_struct = barcode.to_vector

        expect(vector_struct.is_a?(Structs::Vector)).to be true
      end

      it "exports barcode as vector from input file" do
        vector_struct = barcode_with_input_file.to_vector

        expect(vector_struct.is_a?(Structs::Vector)).to be true
      end

      it "exports barcode as vector with readable attributes" do
        v = described_class.new(value: "ABC").to_vector

        expect(v.height.round(2)).to eq(118.9)
        expect(v.width.round(2)).to eq(136.0)
      end

      it "exports barcode as vector of strings" do
        v = described_class.new(value: "ABC").to_vector
        strs = v.each_string.to_a
        expect(strs.size).to eq(1)
        expect(strs[0].text).to eq("ABC")
        expect(strs[0].x).to be > 10.0
        expect(strs[0].y).to be > 10.0
        expect(strs[0].fsize).to eq(14)
        expect(strs[0].width).to be > 10.0
        expect(strs[0].halign).to eq(0)
        expect(strs[0].rotation).to eq(0)
      end

      it "exports barcode as vector of rectangles" do
        v = described_class.new(value: "ABC").to_vector
        strs = v.each_rectangle.to_a
        expect(strs.size).to eq(19)
        expect(strs[0].x).to be >= 0.0
        expect(strs[0].y).to be >= 0.0
        expect(strs[0].height).to be > 1.0
        expect(strs[0].width).to be > 1.0
        expect(strs[0].colour).to eq(-1)
      end

      it "exports barcode as vector of circles" do
        v = described_class.new(value: "ABC", type: Zint::BARCODE_MAXICODE).to_vector
        strs = v.each_circle.to_a
        expect(strs.size).to eq(6)
        expect(strs[0].x).to be >= 1.0
        expect(strs[0].y).to be >= 1.0
        expect(strs[0].diameter).to be > 5.0
        expect(strs[0].colour).to eq(0)
      end

      it "exports barcode as vector of hexagons" do
        v = described_class.new(value: "ABC", type: Zint::BARCODE_MAXICODE).to_vector
        strs = v.each_hexagon.to_a
        expect(strs.size).to be > 100
        expect(strs[0].x).to be >= 1.0
        expect(strs[0].y).to be >= 1.0
        expect(strs[0].diameter).to be > 1.0
        expect(strs[0].rotation).to eq(0)
      end
    end

    describe "attributes" do
      it "sets and gets symbology correctly" do
        barcode.symbology = Zint::BARCODE_CODE39

        expect(barcode.symbology).to eq Zint::BARCODE_CODE39
      end

      it "sets and gets height correctly" do
        barcode.height = 128

        expect(barcode.height).to eq 128
      end

      it "sets and gets whitespace_width correctly" do
        barcode.whitespace_width = 1

        expect(barcode.whitespace_width).to eq 1
      end

      it "sets and gets whitespace_height correctly" do
        barcode.whitespace_height = 1

        expect(barcode.whitespace_height).to eq 1
      end

      it "sets and gets border_width correctly" do
        barcode.border_width = 1

        expect(barcode.border_width).to eq 1
      end

      it "sets and gets output_options correctly" do
        barcode.output_options = 0

        expect(barcode.output_options).to eq 0
      end

      it "sets and gets fgcolour correctly" do
        barcode.fgcolour = "00ff00"

        expect(barcode.fgcolour.to_s).to eq "00ff00"
      end

      it "sets and gets bgcolour correctly" do
        barcode.bgcolour = "00ff00"

        expect(barcode.bgcolour.to_s).to eq "00ff00"
      end

      it "gets outfile correctly" do
        expect(barcode.outfile.to_s).to eq "out.png"
      end

      it "sets and gets scale correctly" do
        barcode.scale = 1

        expect(barcode.scale).to eq 1
      end

      it "sets and gets option_1 correctly" do
        barcode.option_1 = 1

        expect(barcode.option_1).to eq 1
      end

      it "sets and gets option_2 correctly" do
        barcode.option_2 = 1

        expect(barcode.option_2).to eq 1
      end

      it "sets and gets option_3 correctly" do
        barcode.option_3 = 1

        expect(barcode.option_3).to eq 1
      end

      it "sets and gets show_hrt correctly" do
        barcode.show_hrt = 1

        expect(barcode.show_hrt).to eq 1
      end

      it "sets and gets fontsize correctly" do
        barcode.fontsize = 1

        expect(barcode.fontsize).to eq 1
      end

      it "sets and gets input_mode correctly" do
        barcode.input_mode = 1

        expect(barcode.input_mode).to eq 1
      end

      it "sets and gets eci correctly" do
        barcode.eci = 1

        expect(barcode.eci).to eq 1
      end

      it "sets and gets text correctly" do
        barcode.text = "text"

        expect(barcode.text.to_s).to eq "text"
      end

      it "gets rows correctly" do
        expect(barcode.rows).to eq 0
      end

      it "gets width correctly" do
        expect(barcode.width).to eq 0
      end

      it "sets and gets primary correctly" do
        barcode.primary = "primary text"

        expect(barcode.primary.to_s).to eq "primary text"
      end

      it "sets and gets encoded_data correctly" do
        barcode.encoded_data = "encoded_data"

        expect(barcode.encoded_data.to_s).to eq "encoded_data"
      end

      it "sets and gets row_height correctly" do
        expect(barcode.row_height.to_a).to be_kind_of Array
      end

      it "gets errtxt correctly" do
        expect(barcode.errtxt.to_s).to eq ""
      end

      it "gets bitmap_width correctly" do
        barcode.to_buffer

        expect(barcode.bitmap_width).to eq 158
      end

      it "gets bitmap_height correctly" do
        barcode.to_buffer

        expect(barcode.bitmap_height).to eq 116
      end

      it "gets bitmap_byte_length correctly" do
        barcode.to_buffer

        expect(barcode.bitmap_byte_length).to eq 0
      end

      it "sets and gets dot_size correctly" do
        barcode.dot_size = 1

        expect(barcode.dot_size).to eq 1
      end

      it "sets and gets debug correctly" do
        barcode.debug = 1

        expect(barcode.debug).to eq 1
      end

      it "sets and gets warn_level correctly" do
        barcode.warn_level = 1

        expect(barcode.warn_level).to eq 1
      end
    end

    describe "error handling" do
      it "raises matching error" do
        barcode = described_class.new(value: "A" * 4096)
        expect { barcode.to_buffer }.to raise_error(Zint::ErrorTooLong, "Error 340: Input too long (160 character maximum)")
      end
    end

    it "can be explicit freed" do
      barcode = described_class.new(value: "A" * 40)
      barcode.free
      barcode.free # second call is ignored as well as GC registration
    end
  end
end
