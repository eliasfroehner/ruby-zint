module Zint
  RSpec.describe HibcQr do
    describe "export" do
      it "export code" do
        hibcqr_code = described_class.new(value: "012345678912")
        svg_file = hibcqr_code.to_memory_file(extension: ".svg")

        hibcqr_code.to_file(path: "spec/fixtures/hibcqr.svg")
        expect(File.read("spec/fixtures/hibcqr.svg")).to eq svg_file
      end
    end
  end
end
