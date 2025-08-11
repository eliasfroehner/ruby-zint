module Zint
  RSpec.describe Code11 do
    describe "export" do
      it "export code" do
        code11_code = described_class.new(value: "012345678912")
        svg_file = code11_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/code11.svg")
      end
    end
  end
end
