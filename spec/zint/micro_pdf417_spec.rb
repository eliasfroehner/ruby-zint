module Zint
  RSpec.describe MicroPdf417 do
    describe "export" do
      it "export code" do
        micropdf417_code = described_class.new(value: "012345678912")
        svg_file = micropdf417_code.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/micropdf417.svg")).to eq svg_file
      end
    end
  end
end
