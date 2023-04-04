module Zint
  RSpec.describe Vin do
    describe "export" do
      it "export code" do
        vin_code = described_class.new(value: "01234567890123456")
        svg_file = vin_code.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/vin.svg")).to eq svg_file
      end
    end
  end
end
