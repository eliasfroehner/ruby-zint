module Zint
  RSpec.describe Mailmark2D do
    describe "export" do
      it "export code" do
        mailmark_code = described_class.new(value: "JGB 012100123412345678AB19XY1A 0AB18XY")
        svg_file = mailmark_code.to_memory_file(extension: ".svg")

        File.write("spec/fixtures/mailmark_2d.svg", svg_file) if $UPDATE_ZINT_FIXTURES
        expect(svg_file).to eq(File.read("spec/fixtures/mailmark_2d.svg"))
      end
    end
  end
end
