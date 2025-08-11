module Zint
  RSpec.describe Dpleit do
    describe "export" do
      it "export code" do
        dpleit_code = described_class.new(value: "012345678912")
        svg_file = dpleit_code.to_memory_file(extension: ".svg")

        dpleit_code = described_class.new(value: "012345678912")
        dpleit_code.to_file(path: "spec/fixtures/dpleit.svg")
        expect_svg_file(svg_file, "spec/fixtures/dpleit.svg")
      end
    end
  end
end
