module Zint
  RSpec.describe Mailmark do
    describe "export" do
      it "export code" do
        mailmark_code = described_class.new(value: "01000000000000000CI1K3JQ4U")
        svg_file = mailmark_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/mailmark.svg")
      end
    end
  end
end
