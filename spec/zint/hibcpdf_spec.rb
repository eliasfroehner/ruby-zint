module Zint
  RSpec.describe HibcPdf do
    describe "export" do
      it "export code" do
        hibcpdf_code = described_class.new(value: "012345678912")
        svg_file = hibcpdf_code.to_memory_file(extension: ".svg")

        hibcpdf_code = described_class.new(value: "012345678912")
        hibcpdf_code.to_file(path: "spec/fixtures/hibcpdf.svg")
        File.write("spec/fixtures/hibcpdf.svg", svg_file) if $UPDATE_ZINT_FIXTURES
        expect(svg_file).to eq(File.read("spec/fixtures/hibcpdf.svg"))
      end
    end
  end
end
