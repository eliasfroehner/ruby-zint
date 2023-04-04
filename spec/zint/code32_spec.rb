module Zint
  RSpec.describe Code32 do
    describe "export" do
      it "export code" do
        code32_code = described_class.new(value: "01234567")
        svg_file = code32_code.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/code32.svg")).to eq svg_file
      end
    end
  end
end
