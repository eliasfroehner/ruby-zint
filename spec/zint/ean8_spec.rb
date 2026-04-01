module Zint
  RSpec.describe Ean8 do
    describe "export" do
      it "export EAN8 without check" do
        eanx_code = described_class.new(value: "0123456")
        svg_file = eanx_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/ean8.svg")
      end

      it "export EAN8 with check" do
        eanx_code = described_class.new(value: "01234565")
        svg_file = eanx_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/ean8.svg")
      end
    end

    it "provides encoded_data without check" do
      enc = Zint::Ean8.new(value: "2092001").encode.encoded_data_as_array_of_strings
      expect(enc).to eq ["1010010011000110100010110010011010101110010111001011001101101100101"]
    end

    it "provides encoded_data with check" do
      enc = Zint::Ean8.new(value: "20920012").encode.encoded_data_as_array_of_strings
      expect(enc).to eq ["1010010011000110100010110010011010101110010111001011001101101100101"]
    end
  end
end
