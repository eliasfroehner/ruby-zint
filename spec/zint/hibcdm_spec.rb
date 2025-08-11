module Zint
  RSpec.describe HibcDm do
    describe "export" do
      it "export code" do
        hibcdm_code = described_class.new(value: "012345678912")
        svg_file = hibcdm_code.to_memory_file(extension: ".svg")

        hibcdm_code = described_class.new(value: "012345678912")
        hibcdm_code.to_file(path: "spec/fixtures/hibcdm.svg")
        expect_svg_file(svg_file, "spec/fixtures/hibcdm.svg")
      end
    end
  end
end
