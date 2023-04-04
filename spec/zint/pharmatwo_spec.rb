module Zint
  RSpec.describe PharmaTwo do
    describe "export" do
      it "export code" do
        pharmatwo_code = described_class.new(value: "01234567")
        svg_file = pharmatwo_code.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/pharmatwo.svg")).to eq svg_file
      end
    end
  end
end
