module Zint
  RSpec.describe Hanxin do
    describe "export" do
      it "export code" do
        hanxin_code = described_class.new(value: "012345678912")
        svg_file = hanxin_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/hanxin.svg")
      end
    end
  end
end
