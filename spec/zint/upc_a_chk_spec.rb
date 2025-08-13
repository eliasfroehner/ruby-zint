module Zint
  RSpec.describe UpcAChk do
    describe "export" do
      it "export code" do
        upcachk_code = described_class.new(value: "012345678912")
        svg_file = upcachk_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/upcachk.svg")
      end
    end
  end
end
