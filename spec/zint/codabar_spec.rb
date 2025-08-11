module Zint
  RSpec.describe Codabar do
    describe "export" do
      it "export code" do
        codabar_code = described_class.new(value: "A37859B")
        svg_file = codabar_code.to_memory_file(extension: ".svg")

        File.write("spec/fixtures/codabar.svg", svg_file) if $UPDATE_ZINT_FIXTURES
        expect(svg_file).to eq(File.read("spec/fixtures/codabar.svg"))
      end
    end
  end
end
