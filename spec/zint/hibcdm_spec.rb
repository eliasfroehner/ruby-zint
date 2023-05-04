module Zint
  RSpec.describe HibcDm do
    describe "export" do
      it "export code" do
        hibcdm_code = described_class.new(value: "012345678912")
        svg_file = hibcdm_code.to_memory_file(extension: ".svg")

        hibcdm_code = described_class.new(value: "012345678912")
        hibcdm_code.to_file(path: "spec/fixtures/hibcdm.svg")
        expect(File.read("spec/fixtures/hibcdm.svg")).to eq svg_file
      end
    end
  end
end
