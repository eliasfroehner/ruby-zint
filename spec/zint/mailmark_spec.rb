module Zint
  RSpec.describe Mailmark do
    describe "export" do
      it "export code" do
        mailmark_code = described_class.new(value: "01000000000000000CI1K3JQ4U")
        svg_file = mailmark_code.to_memory_file(extension: ".svg")

        File.write("spec/fixtures/mailmark.svg", svg_file) if $UPDATE_ZINT_FIXTURES
        expect(svg_file).to eq(File.read("spec/fixtures/mailmark.svg"))
      end
    end
  end
end
