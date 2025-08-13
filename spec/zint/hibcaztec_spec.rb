module Zint
  RSpec.describe HibcAztec do
    describe "export" do
      it "export code" do
        hibcaztec_code = described_class.new(value: "012345678912")
        svg_file = hibcaztec_code.to_memory_file(extension: ".svg")

        hibcaztec_code = described_class.new(value: "012345678912")
        hibcaztec_code.to_file(path: "spec/fixtures/hibcaztec.svg")
        expect_svg_file(svg_file, "spec/fixtures/hibcaztec.svg")
      end
    end
  end
end
