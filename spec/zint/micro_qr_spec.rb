module Zint
  RSpec.describe MicroQr do
    describe "export" do
      it "export code" do
        microqr_code = described_class.new(value: "012345678912")
        svg_file = microqr_code.to_memory_file(extension: ".svg")

        File.write("spec/fixtures/microqr.svg", svg_file) if $UPDATE_ZINT_FIXTURES
        expect(svg_file).to eq(File.read("spec/fixtures/microqr.svg"))
      end
    end
  end
end
