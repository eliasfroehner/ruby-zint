module Zint
  RSpec.describe EanxChk do
    describe "export" do
      it "export code" do
        eanxchk_code = described_class.new(value: "012345678912")
        svg_file = eanxchk_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/eanxchk.svg")
      end
    end
  end
end
