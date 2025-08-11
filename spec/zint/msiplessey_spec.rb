module Zint
  RSpec.describe MsiPlessey do
    describe "export" do
      it "export code" do
        msiplessey_code = described_class.new(value: "012345678912")
        svg_file = msiplessey_code.to_memory_file(extension: ".svg")

        File.write("spec/fixtures/msiplessey.svg", svg_file) if $UPDATE_ZINT_FIXTURES
        expect(svg_file).to eq(File.read("spec/fixtures/msiplessey.svg"))
      end
    end
  end
end
