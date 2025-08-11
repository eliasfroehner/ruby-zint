module Zint
  RSpec.describe GridMatrix do
    describe "export" do
      it "export code" do
        gridmatrix_code = described_class.new(value: "012345678912")
        svg_file = gridmatrix_code.to_memory_file(extension: ".svg")

        File.write("spec/fixtures/gridmatrix.svg", svg_file) if $UPDATE_ZINT_FIXTURES
        expect(svg_file).to eq(File.read("spec/fixtures/gridmatrix.svg"))
      end
    end
  end
end
