module Zint
  RSpec.describe UpcEChk do
    describe "export" do
      it "export code" do
        upcechk_code = described_class.new(value: "12345670")
        svg_file = upcechk_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/upcechk.svg")
      end
    end
  end
end
