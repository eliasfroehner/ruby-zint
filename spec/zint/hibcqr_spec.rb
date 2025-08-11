module Zint
  RSpec.describe HibcQr do
    describe "export" do
      it "export code" do
        hibcqr_code = described_class.new(value: "012345678912")
        svg_file = hibcqr_code.to_memory_file(extension: ".svg")

        hibcqr_code = described_class.new(value: "012345678912")
        hibcqr_code.to_file(path: "spec/fixtures/hibcqr.svg")
        expect_svg_file(svg_file, "spec/fixtures/hibcqr.svg")
      end
    end
  end
end
