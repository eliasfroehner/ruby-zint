module Zint
  RSpec.describe HibcPdf do
    describe "export" do
      it "export code" do
        hibcpdf_code = described_class.new(value: "012345678912")
        svg_file = hibcpdf_code.to_memory_file(extension: ".svg")

        hibcpdf_code = described_class.new(value: "012345678912")
        hibcpdf_code.to_file(path: "spec/fixtures/hibcpdf.svg")
        expect(File.read("spec/fixtures/hibcpdf.svg")).to eq svg_file
      end
    end
  end
end
