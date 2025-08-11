module Zint
  RSpec.describe OneCode do
    describe "export" do
      it "export code" do
        onecode_code = described_class.new(value: "01234567890123456789")
        svg_file = onecode_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/onecode.svg")
      end
    end
  end
end
