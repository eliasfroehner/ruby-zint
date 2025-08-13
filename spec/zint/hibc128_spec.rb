module Zint
  RSpec.describe Hibc128 do
    describe "export" do
      it "export code" do
        hibc128_code = described_class.new(value: "012345678912")
        svg_file = hibc128_code.to_memory_file(extension: ".svg")

        hibc128_code = described_class.new(value: "012345678912")
        hibc128_code.to_file(path: "spec/fixtures/hibc128.svg")
        expect_svg_file(svg_file, "spec/fixtures/hibc128.svg")
      end
    end
  end
end
