module Zint
  RSpec.describe Nve18 do
    describe "export" do
      it "export code" do
        nve18_code = described_class.new(value: "12345678901234567")
        svg_file = nve18_code.to_memory_file(extension: ".svg")

        File.write("spec/fixtures/nve18.svg", svg_file) if $UPDATE_ZINT_FIXTURES
        expect(svg_file).to eq(File.read("spec/fixtures/nve18.svg"))
      end
    end
  end
end
