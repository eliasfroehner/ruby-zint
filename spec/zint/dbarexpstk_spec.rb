module Zint
  RSpec.describe DbarExpstk do
    describe "export" do
      it "export code" do
        dbarexpstk_code = described_class.new(value: "[20]12")
        svg_file = dbarexpstk_code.to_memory_file(extension: ".svg")

        File.write("spec/fixtures/dbarexpstk.svg", svg_file) if $UPDATE_ZINT_FIXTURES
        expect(svg_file).to eq(File.read("spec/fixtures/dbarexpstk.svg"))
      end
    end
  end
end
