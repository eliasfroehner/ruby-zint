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
        bitmap = barcode.to_bitmap

        require "chunky_png"
        png = ChunkyPNG::Image.new(bitmap.width, bitmap.height, ChunkyPNG::Color::TRANSPARENT)
        white = ChunkyPNG::Color("white")
        black = ChunkyPNG::Color("black")

        bitmap.pixels.each do |pixel|
          png.compose_pixel(pixel.x, pixel.y, (pixel.colour == "1") ? black : white)
        end

        png.save(buffer_outfile)

        File.binwrite("spec/fixtures/buffer.png", File.binread(buffer_outfile)) if $UPDATE_ZINT_FIXTURES
        expect(File.binread(buffer_outfile)).to eq File.binread("spec/fixtures/buffer.png")
      end

      it "exports barcode to bitmap only once" do
        barcode.to_bitmap
        expect { barcode.to_bitmap }.to raise_error(Zint::Barcode::AlreadyGenerated)
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

        File.binwrite("spec/fixtures/buffer_from_input_file.png", File.binread(buffer_outfile)) if $UPDATE_ZINT_FIXTURES
        expect(File.binread(buffer_outfile)).to eq File.binread("spec/fixtures/buffer_from_input_file.png")
      end

      it "exports colored barcode to buffer from value" do
        require "digest/md5"

        bitmap = described_class.new(value: "Test", symbology: Zint::BARCODE_ULTRA).to_bitmap

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

        File.write("spec/fixtures/barcode_raw_bitmap.txt", bitmap) if $UPDATE_ZINT_FIXTURES
        expect(bitmap).to eq File.read("spec/fixtures/barcode_raw_bitmap.txt")
      end

      it "exports barcode to buffer only once" do
        barcode.to_buffer
        expect { barcode.to_buffer }.to raise_error(Zint::Barcode::AlreadyGenerated)
      end

      it "exports barcode as vector from given value" do
        vector_struct = barcode.to_vector

        expect(vector_struct.is_a?(Structs::Vector)).to be true
      end

      it "exports barcode to vector only once" do
        barcode.to_vector
        expect { barcode.to_vector }.to raise_error(Zint::Barcode::AlreadyGenerated)
      end

      it "exports barcode as vector from input file" do
        vector_struct = barcode_with_input_file.to_vector

        expect(vector_struct.is_a?(Structs::Vector)).to be true
      end

      it "exports barcode as vector with readable attributes" do
        v = described_class.new(value: "ABC").to_vector

        expect(v.height.round(2)).to eq(116.28)
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
        v = described_class.new(value: "ABC", symbology: Zint::BARCODE_MAXICODE).to_vector
        strs = v.each_circle.to_a
        expect(strs.size).to eq(3)
        expect(strs[0].x).to be >= 1.0
        expect(strs[0].y).to be >= 1.0
        expect(strs[0].diameter).to be > 5.0
        expect(strs[0].colour).to eq(0)
      end

      it "exports barcode as vector of hexagons" do
        v = described_class.new(value: "ABC", symbology: Zint::BARCODE_MAXICODE).to_vector
        strs = v.each_hexagon.to_a
        expect(strs.size).to be > 100
        expect(strs[0].x).to be >= 1.0
        expect(strs[0].y).to be >= 1.0
        expect(strs[0].diameter).to be > 1.0
        expect(strs[0].rotation).to eq(0)
      end

      it "encodes the barcode without export" do
        b = barcode.encode
        expect(b).to be(barcode)
        expect(barcode.rows).to be > 0
        expect(barcode.width).to be > 0
        expect(barcode.encoded_data_as_array_of_strings).to be_kind_of(Array)
        expect(barcode.encoded_data_as_array_of_strings[0]).to be_kind_of(String)
      end
    end

    describe "attributes" do
      it "sets and gets value" do
        barcode = Zint::Eanx.new value: "1234567"
        expect(barcode.value).to eq "1234567"

        barcode = Zint::Eanx.new
        barcode.value = "2345678"
        expect(barcode.value).to eq "2345678"
      end

      it "sets and gets input_file" do
        barcode = Zint::Eanx.new
        barcode.input_file = "non-existant"
        expect(barcode.input_file).to eq "non-existant"
      end

      it "sets and gets symbology correctly" do
        bc = Zint::Barcode.new symbology: Zint::BARCODE_CODE39

        expect(bc.symbology).to eq Zint::BARCODE_CODE39
      end

      it "sets and gets height correctly" do
        bc = Zint::Barcode.new height: 128

        expect(bc.height).to eq 128
      end

      it "sets and gets whitespace_width correctly" do
        bc = Zint::Barcode.new whitespace_width: 1

        expect(bc.whitespace_width).to eq 1
      end

      it "sets and gets whitespace_height correctly" do
        bc = Zint::Barcode.new whitespace_height: 1

        expect(bc.whitespace_height).to eq 1
      end

      it "sets and gets border_width correctly" do
        bc = Zint::Barcode.new border_width: 1

        expect(bc.border_width).to eq 1
      end

      it "sets and gets output_options correctly" do
        bc = Zint::Barcode.new output_options: 0

        expect(bc.output_options).to eq 0
      end

      it "sets and gets fgcolour correctly" do
        bc = Zint::Barcode.new fgcolour: "00ff00"

        expect(bc.fgcolour).to eq "00ff00"
      end

      it "sets and gets bgcolour correctly" do
        bc = Zint::Barcode.new bgcolour: "00ff00"

        expect(bc.bgcolour).to eq "00ff00"
      end

      it "gets outfile correctly" do
        expect(barcode.outfile).to eq "out.png"
      end

      it "sets and gets scale correctly" do
        bc = Zint::Barcode.new scale: 1
        expect(bc.scale).to eq 1
        bc.scale = 2
        expect(bc.scale).to eq 2
      end

      it "sets and gets option_1 correctly" do
        bc = Zint::Barcode.new option_1: 1

        expect(bc.option_1).to eq 1
      end

      it "sets and gets option_2 correctly" do
        bc = Zint::Barcode.new option_2: 1

        expect(bc.option_2).to eq 1
      end

      it "sets and gets option_3 correctly" do
        bc = Zint::Barcode.new option_3: 1

        expect(bc.option_3).to eq 1
      end

      it "sets and gets show_hrt correctly" do
        bc = Zint::Barcode.new show_hrt: 1

        expect(bc.show_hrt).to eq 1
      end

      it "sets and gets input_mode correctly" do
        bc = Zint::Barcode.new input_mode: 1

        expect(bc.input_mode).to eq 1
      end

      it "sets and gets eci correctly" do
        bc = Zint::Barcode.new eci: 1

        expect(bc.eci).to eq 1
      end

      it "sets and gets dpmm correctly" do
        bc = Zint::Barcode.new dpmm: 1

        expect(bc.dpmm).to eq 1
      end

      it "sets and gets guard_descent correctly" do
        bc = Zint::Barcode.new guard_descent: 10

        expect(bc.guard_descent).to eq 10
      end

      it "sets and gets structapp correctly" do
        bc = Zint::Barcode.new structapp: Structs::Structapp.new

        expect(bc.structapp).to be_kind_of Structs::Structapp
      end

      it "provides text with checksum" do
        barcode = Zint::Eanx.new(value: "123456789012").encode
        expect(barcode.text).to eq "1234567890128"
      end

      it "gets rows correctly" do
        expect(barcode.rows).to eq 0
      end

      it "gets width correctly" do
        expect(barcode.width).to eq 0
      end

      it "sets and gets primary correctly" do
        bc = Zint::Barcode.new primary: "primary text"

        expect(bc.primary).to eq "primary text"
      end

      it "gets errtxt correctly" do
        expect(barcode.errtxt).to eq ""
      end

      it "gets bitmap_width correctly" do
        barcode.to_buffer

        expect(barcode.bitmap_width).to eq 158
      end

      it "gets bitmap_height correctly" do
        barcode.to_buffer

        expect(barcode.bitmap_height).to eq 116
      end

      it "sets and gets dot_size correctly" do
        bc = Zint::Barcode.new dot_size: 1

        expect(bc.dot_size).to eq 1
      end

      it "sets and gets debug correctly" do
        bc = Zint::Barcode.new debug: 1

        expect(bc.debug).to eq 1
      end

      it "sets and gets warn_level correctly" do
        bc = Zint::Barcode.new warn_level: 1
        expect(bc.warn_level).to eq 1
        bc.warn_level = 2
        expect(bc.warn_level).to eq 2
      end
    end

    describe "error handling" do
      it "raises matching error at .to_buffer" do
        barcode = described_class.new(value: "A" * 4096)
        expect { barcode.to_buffer }.to raise_error(Zint::ErrorTooLong, "Error 340: Input length 4096 too long (maximum 256)")
      end

      it "raises matching error at .to_vector" do
        barcode = described_class.new(value: "A" * 4096)
        expect { barcode.to_vector }.to raise_error(Zint::ErrorTooLong, "Error 340: Input length 4096 too long (maximum 256)")
      end
    end

    it "can be explicit freed" do
      barcode = described_class.new(value: "A" * 40)
      barcode.free
      barcode.free # second call is ignored as well as GC registration
    end
  end
end
