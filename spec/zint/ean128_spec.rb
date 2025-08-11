module Zint
  RSpec.describe Ean128 do
    describe "export" do
      it "export code" do
        ean128_code = described_class.new(value: "[01]12345678901231")
        svg_file = ean128_code.to_memory_file(extension: ".svg")

        File.write("spec/fixtures/ean128.svg", svg_file) if $UPDATE_ZINT_FIXTURES
        expect(svg_file).to eq(File.read("spec/fixtures/ean128.svg"))
      end
    end
  end
end
