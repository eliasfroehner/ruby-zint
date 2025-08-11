module Zint
  RSpec.describe Itf14 do
    describe "export" do
      it "export code" do
        itf14_code = described_class.new(value: "012345678912")
        svg_file = itf14_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/itf14.svg")
      end
    end
  end
end
