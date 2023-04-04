module Zint
  RSpec.describe MicroQr do
    describe "export" do
      it "export code" do
        microqr_code = described_class.new(value: "012345678912")
        svg_file = microqr_code.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/microqr.svg")).to eq svg_file
      end
    end
  end
end
