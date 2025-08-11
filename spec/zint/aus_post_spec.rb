module Zint
  RSpec.describe AusPost do
    describe "export" do
      it "export code" do
        auspost_code = described_class.new(value: "96184209")
        svg_file = auspost_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/auspost.svg")
      end
    end
  end
end
