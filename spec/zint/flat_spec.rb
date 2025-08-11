module Zint
  RSpec.describe Flat do
    describe "export" do
      it "export code" do
        flat_code = described_class.new(value: "012345678912")
        svg_file = flat_code.to_memory_file(extension: ".svg")

        File.write("spec/fixtures/flat.svg", svg_file) if $UPDATE_ZINT_FIXTURES
        expect(svg_file).to eq(File.read("spec/fixtures/flat.svg"))
      end
    end
  end
end
