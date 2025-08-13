module Zint
  RSpec.describe C25matrix do
    describe "export" do
      it "export code" do
        c25matrix_code = described_class.new(value: "012345678912")
        svg_file = c25matrix_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/c25matrix.svg")
      end
    end
  end
end
