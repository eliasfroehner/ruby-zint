module Zint
  RSpec.describe KoreaPost do
    describe "export" do
      it "export code" do
        koreapost_code = described_class.new(value: "012345")
        svg_file = koreapost_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/koreapost.svg")
      end
    end
  end
end
