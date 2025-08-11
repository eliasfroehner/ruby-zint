module Zint
  RSpec.describe Code32 do
    describe "export" do
      it "export code" do
        code32_code = described_class.new(value: "01234567")
        svg_file = code32_code.to_memory_file(extension: ".svg")

        File.write("spec/fixtures/code32.svg", svg_file) if $UPDATE_ZINT_FIXTURES
        expect(svg_file).to eq(File.read("spec/fixtures/code32.svg"))
      end
    end
  end
end
