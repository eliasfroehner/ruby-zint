module Zint
  RSpec.describe UpcE do
    describe "export" do
      it "export code" do
        upce_code = described_class.new(value: "12345670")
        svg_file = upce_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/upce.svg")
      end
    end
  end
end
