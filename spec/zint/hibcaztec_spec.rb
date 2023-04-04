module Zint
  RSpec.describe HibcAztec do
    describe "export" do
      it "export code" do
        hibcaztec_code = described_class.new(value: "012345678912")
        svg_file = hibcaztec_code.to_memory_file(extension: ".svg")

        hibcaztec_code.to_file(path: "spec/fixtures/hibcaztec.svg")
        expect(File.read("spec/fixtures/hibcaztec.svg")).to eq svg_file
      end
    end
  end
end
