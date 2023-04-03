module Zint
  RSpec.describe Barcode do
    describe "exports" do
      let(:barcode) { described_class.new(value: "Test") }

      let(:outfile) { File.join(Dir.tmpdir, "out.png") }
      let(:buffer_outfile) { File.join(Dir.tmpdir, "buffer.png") }
      let(:input_file) { "spec/fixtures/input_file.txt" }

      after do
        [outfile, buffer_outfile].each do |file|
          File.delete(file) if File.exist?(file)
        end
      end

      it "exports barcode to file" do
        barcode.to_file(path: outfile)

        pp outfile
        expect(File.exist?(outfile)).to be true
      end

      it "exports barcode to memory file" do
        svg_file = barcode.to_memory_file(extension: ".svg")

        expect(svg_file.include?("<svg")).to be true
      end

      it "exports barcode to buffer" do
        require "digest/md5"

        bitmap = barcode.to_buffer

        require "chunky_png"
        png = ChunkyPNG::Image.new(bitmap.width, bitmap.height, ChunkyPNG::Color::TRANSPARENT)
        white = ChunkyPNG::Color("white")
        black = ChunkyPNG::Color("black")

        bitmap.pixels.each do |pixel|
          png.compose_pixel(pixel.x, pixel.y, (pixel.colour == "K") ? black : white)
        end

        png.save(buffer_outfile)

        expect(Digest::MD5.file(buffer_outfile).hexdigest).to eq Digest::MD5.file("spec/fixtures/buffer.png").hexdigest
      end

      it "exports barcode as vector" do
        vector_struct = barcode.to_vector

        expect(vector_struct.is_a?(Zint::Structs::Vector)).to be true
      end
    end

    describe "error handling" do
      it "raises matching error" do
        barcode = described_class.new(value: "A" * 4096)
        expect { barcode.to_buffer }.to raise_error(Zint::ErrorTooLong, "Error 340: Input too long (160 character maximum)")
      end
    end
  end
end
