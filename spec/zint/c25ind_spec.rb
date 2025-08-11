module Zint
  RSpec.describe C25ind do
    describe "export" do
      it "export code" do
        c25ind_code = described_class.new(value: "012345678912")
        svg_file = c25ind_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/c25ind.svg")
      end
    end
  end
end
