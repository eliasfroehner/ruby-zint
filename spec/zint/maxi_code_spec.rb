module Zint
  RSpec.describe MaxiCode do
    describe "export" do
      it "export code" do
        maxicode_code = described_class.new(value: "012345678912")
        svg_file = maxicode_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/maxicode.svg")
      end
    end
  end
end
