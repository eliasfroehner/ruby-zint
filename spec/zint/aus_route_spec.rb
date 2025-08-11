module Zint
  RSpec.describe AusRoute do
    describe "export" do
      it "export code" do
        ausroute_code = described_class.new(value: "96184209")
        svg_file = ausroute_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/ausroute.svg")
      end
    end
  end
end
