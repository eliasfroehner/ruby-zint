module Zint
  RSpec.describe UpcE do
    describe "export" do
      it "export code" do
        upce_code = described_class.new(value: "12345670")
        svg_file = upce_code.to_memory_file(extension: ".svg")

        File.write("spec/fixtures/upce.svg", svg_file) if $UPDATE_ZINT_FIXTURES
        expect(svg_file).to eq(File.read("spec/fixtures/upce.svg"))
      end
    end
  end
end
