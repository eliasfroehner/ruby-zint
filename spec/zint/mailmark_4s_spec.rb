module Zint
  RSpec.describe Mailmark4S do
    describe "export" do
      it "export code" do
        mailmark_code = described_class.new(value: "22799999999999999C123JQ4U")
        svg_file = mailmark_code.to_memory_file(extension: ".svg")

        File.write("spec/fixtures/mailmark_4s.svg", svg_file) if $UPDATE_ZINT_FIXTURES
        expect(svg_file).to eq(File.read("spec/fixtures/mailmark_4s.svg"))
      end
    end
  end
end
