module Zint
  RSpec.describe JapanPost do
    describe "export" do
      it "export code" do
        japanpost_code = described_class.new(value: "012345678912")
        svg_file = japanpost_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/japanpost.svg")
      end
    end
  end
end
