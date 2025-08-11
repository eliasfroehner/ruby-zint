module Zint
  RSpec.describe HibcMicpdf do
    describe "export" do
      it "export code" do
        hibcmicpdf_code = described_class.new(value: "012345678912")
        svg_file = hibcmicpdf_code.to_memory_file(extension: ".svg")

        hibcmicpdf_code = described_class.new(value: "012345678912")
        hibcmicpdf_code.to_file(path: "spec/fixtures/hibcmicpdf.svg")
        File.write("spec/fixtures/hibcmicpdf.svg", svg_file) if $UPDATE_ZINT_FIXTURES
        expect(svg_file).to eq(File.read("spec/fixtures/hibcmicpdf.svg"))
      end
    end
  end
end
