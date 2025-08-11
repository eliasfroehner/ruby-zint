module Zint
  RSpec.describe PharmaTwo do
    describe "export" do
      it "export code" do
        pharmatwo_code = described_class.new(value: "01234567")
        svg_file = pharmatwo_code.to_memory_file(extension: ".svg")

        File.write("spec/fixtures/pharmatwo.svg", svg_file) if $UPDATE_ZINT_FIXTURES
        expect(svg_file).to eq(File.read("spec/fixtures/pharmatwo.svg"))
      end
    end
  end
end
