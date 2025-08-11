module Zint
  RSpec.describe Daft do
    describe "export" do
      it "export code" do
        daft_code = described_class.new(value: "DAFT")
        svg_file = daft_code.to_memory_file(extension: ".svg")

        File.write("spec/fixtures/daft.svg", svg_file) if $UPDATE_ZINT_FIXTURES
        expect(svg_file).to eq(File.read("spec/fixtures/daft.svg"))
      end
    end
  end
end
