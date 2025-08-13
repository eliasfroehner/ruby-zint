module Zint
  RSpec.describe UpcA do
    describe "export" do
      it "export code" do
        upca_code = described_class.new(value: "012345678912")
        svg_file = upca_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/upca.svg")
      end
    end
  end
end
