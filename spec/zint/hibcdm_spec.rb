module Zint
  RSpec.describe HibcDm do
    describe "export" do
      it "export code" do
        hibcdm_code = described_class.new(value: "012345678912")
        svg_file = hibcdm_code.to_memory_file(extension: ".svg")

        hibcdm_code = described_class.new(value: "012345678912")
        hibcdm_code.to_file(path: "spec/fixtures/hibcdm.svg")
        File.write("spec/fixtures/hibcdm.svg", svg_file) if $UPDATE_ZINT_FIXTURES
        expect(svg_file).to eq(File.read("spec/fixtures/hibcdm.svg"))
      end
    end
  end
end
