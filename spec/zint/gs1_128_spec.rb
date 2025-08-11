module Zint
  RSpec.describe Gs1_128 do
    describe "export" do
      it "export code" do
        gs1128_code = described_class.new(value: "[01]12345678901231")
        svg_file = gs1128_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/gs1128.svg")
      end
    end
  end
end
