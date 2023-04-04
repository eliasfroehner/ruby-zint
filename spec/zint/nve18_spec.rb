module Zint
  RSpec.describe Nve18 do
    describe "export" do
      it "export code" do
        nve18_code = described_class.new(value: "12345678901234567")
        svg_file = nve18_code.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/nve18.svg")).to eq svg_file
      end
    end
  end
end
