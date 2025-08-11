module Zint
  RSpec.describe Mailmark4S do
    describe "export" do
      it "export code" do
        mailmark_code = described_class.new(value: "22799999999999999C123JQ4U")
        svg_file = mailmark_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/mailmark_4s.svg")
      end
    end
  end
end
