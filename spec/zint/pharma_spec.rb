module Zint
  RSpec.describe Pharma do
    describe "export" do
      it "export code" do
        pharma_code = described_class.new(value: "012345")
        svg_file = pharma_code.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/pharma.svg")).to eq svg_file
      end
    end
  end
end
