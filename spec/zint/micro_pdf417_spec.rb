module Zint
  RSpec.describe MicroPdf417 do
    describe "export" do
      it "export code" do
        micropdf417_code = described_class.new(value: "012345678912")
        svg_file = micropdf417_code.to_memory_file(extension: ".svg")

        File.write("spec/fixtures/micropdf417.svg", svg_file) if $UPDATE_ZINT_FIXTURES
        expect(svg_file).to eq(File.read("spec/fixtures/micropdf417.svg"))
      end
    end
  end
end
