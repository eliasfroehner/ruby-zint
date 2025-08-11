module Zint
  RSpec.describe Pdf417 do
    describe "export" do
      it "export code" do
        pdf417_code = described_class.new(value: "012345678912")
        svg_file = pdf417_code.to_memory_file(extension: ".svg")

        File.write("spec/fixtures/pdf417.svg", svg_file) if $UPDATE_ZINT_FIXTURES
        expect(svg_file).to eq(File.read("spec/fixtures/pdf417.svg"))
      end
    end
  end
end
