module Zint
  RSpec.describe AusPost do
    describe "export" do
      it "export code" do
        auspost_code = described_class.new(value: "96184209")
        svg_file = auspost_code.to_memory_file(extension: ".svg")

        File.write("spec/fixtures/auspost.svg", svg_file) if $UPDATE_ZINT_FIXTURES
        expect(svg_file).to eq(File.read("spec/fixtures/auspost.svg"))
      end
    end
  end
end
