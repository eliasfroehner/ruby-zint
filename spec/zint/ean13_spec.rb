module Zint
  RSpec.describe Ean13 do
    describe "export" do
      it "export EAN8 without check" do
        eanx_code = described_class.new(value: "012345678912")
        svg_file = eanx_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/ean13.svg")
      end

      it "export EAN8 with check" do
        eanx_code = described_class.new(value: "0123456789128")
        svg_file = eanx_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/ean13.svg")
      end
    end

    it "provides encoded_data without check" do
      enc = Zint::Ean13.new(value: "209200147435").encode.encoded_data_as_array_of_strings
      expect(enc).to eq ["10100011010001011001101101001110001101011001101010101110010001001011100100001010011101000010101"]
    end

    it "provides encoded_data with check" do
      enc = Zint::Ean13.new(value: "2092001474353").encode.encoded_data_as_array_of_strings
      expect(enc).to eq ["10100011010001011001101101001110001101011001101010101110010001001011100100001010011101000010101"]
    end
  end
end
