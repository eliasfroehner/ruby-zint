module Zint
  RSpec.describe Vin do
    describe "export" do
      it "export code" do
        vin_code = described_class.new(value: "01234567890123456")
        svg_file = vin_code.to_memory_file(extension: ".svg")

        File.write("spec/fixtures/vin.svg", svg_file) if $UPDATE_ZINT_FIXTURES
        expect(svg_file).to eq(File.read("spec/fixtures/vin.svg"))
      end
    end
  end
end
