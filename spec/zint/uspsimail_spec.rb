module Zint
  RSpec.describe UspsImail do
    describe "export" do
      it "export code" do
        uspsimail_code = described_class.new(value: "01234567890123456789")
        svg_file = uspsimail_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/uspsimail.svg")
      end
    end
  end
end
