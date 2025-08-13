module Zint
  RSpec.describe Code93 do
    describe "export" do
      it "export code" do
        code93_code = described_class.new(value: "012345678912")
        svg_file = code93_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/code93.svg")
      end
    end
  end
end
