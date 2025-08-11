module Zint
  RSpec.describe Pdf417trunc do
    describe "export" do
      it "export code" do
        pdf417trunc_code = described_class.new(value: "012345678912")
        svg_file = pdf417trunc_code.to_memory_file(extension: ".svg")

        File.write("spec/fixtures/pdf417trunc.svg", svg_file) if $UPDATE_ZINT_FIXTURES
        expect(svg_file).to eq(File.read("spec/fixtures/pdf417trunc.svg"))
      end
    end
  end
end
