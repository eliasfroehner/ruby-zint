module Zint
  RSpec.describe HibcQr do
    describe "export" do
      it "export code" do
        hibcqr_code = described_class.new(value: "012345678912")
        svg_file = hibcqr_code.to_memory_file(extension: ".svg")

        hibcqr_code = described_class.new(value: "012345678912")
        hibcqr_code.to_file(path: "spec/fixtures/hibcqr.svg")
        File.write("spec/fixtures/hibcqr.svg", svg_file) if $UPDATE_ZINT_FIXTURES
        expect(svg_file).to eq(File.read("spec/fixtures/hibcqr.svg"))
      end
    end
  end
end
