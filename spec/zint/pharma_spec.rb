module Zint
  RSpec.describe Pharma do
    describe "export" do
      it "export code" do
        pharma_code = described_class.new(value: "012345")
        svg_file = pharma_code.to_memory_file(extension: ".svg")

        File.write("spec/fixtures/pharma.svg", svg_file) if $UPDATE_ZINT_FIXTURES
        expect(svg_file).to eq(File.read("spec/fixtures/pharma.svg"))
      end
    end
  end
end
