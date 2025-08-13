module Zint
  RSpec.describe Code49 do
    describe "export" do
      it "export code" do
        code49_code = described_class.new(value: "012345678912")
        svg_file = code49_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/code49.svg")
      end
    end
  end
end
