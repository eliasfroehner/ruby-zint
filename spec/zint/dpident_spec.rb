module Zint
  RSpec.describe Dpident do
    describe "export" do
      it "export code" do
        dpident_code = described_class.new(value: "01234567891")
        svg_file = dpident_code.to_memory_file(extension: ".svg")

        File.write("spec/fixtures/dpident.svg", svg_file) if $UPDATE_ZINT_FIXTURES
        expect(svg_file).to eq(File.read("spec/fixtures/dpident.svg"))
      end
    end
  end
end
