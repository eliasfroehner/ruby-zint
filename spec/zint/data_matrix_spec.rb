module Zint
  RSpec.describe DataMatrix do
    describe "type" do
      it "supports only DataMatrix types" do
        expect { described_class.new(value: "Test", type: Zint::BARCODE_DATAMATRIX) }.not_to raise_error
        expect { described_class.new(value: "Test", type: Zint::BARCODE_HIBC_DM) }.not_to raise_error
      rescue RSpec::Expectations::ExpectationNotMetError => e
        expect(e.message).not_to include "AnError"
      end
      it "raises error on invalid type" do
        expect { described_class.new(value: "Test", type: Zint::BARCODE_AZTEC) }.to raise_error ArgumentError
      end
    end

    it "provides encoded_data" do
      enc = Zint::DataMatrix.new(value: "12345").encode.encoded_data_as_array_of_strings
      expect(enc).to eq(["1010101010",
        "1101100111",
        "1100010110",
        "1100110101",
        "1100111000",
        "1000011111",
        "1101011110",
        "1110000111",
        "1101100100",
        "1111111111"])
    end

    describe "export" do
      it "export DataMatrix code" do
        dm_code = described_class.new(value: "/ACMRN123456/V200912190833")
        svg_file = dm_code.to_memory_file(extension: ".svg")

        expect(svg_file).to eq File.read("spec/fixtures/data_matrix.svg")
      end

      it "export German Post DataMatrix code" do
        dm_code = described_class.new(value: "\x44\x45\x41\x12\x33\x01\x2c\xcc\xaa\x60\x00\x55\x48\x5c\x00\x01\x00\x00\x01\x02\x19\xa5\x00\x20\x20")
        dm_code.option_2 = 9 # 26x26 symbol size
        svg_file = dm_code.to_memory_file(extension: ".svg")

        expect(svg_file).to eq File.read("spec/fixtures/data_matrix_german_post.svg")
      end
    end
  end
end
