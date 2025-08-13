module Zint
  RSpec.describe Code16k do
    describe "export" do
      it "export code" do
        code16k_code = described_class.new(value: "012345678912")
        svg_file = code16k_code.to_memory_file(extension: ".svg")
        expect_svg_file(svg_file, "spec/fixtures/code16k.svg")
      end
    end
  end
end
