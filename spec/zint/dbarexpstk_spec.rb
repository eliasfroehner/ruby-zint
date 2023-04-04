module Zint
  RSpec.describe DbarExpstk do
    describe "export" do
      it "export code" do
        dbarexpstk_code = described_class.new(value: "[20]12")
        svg_file = dbarexpstk_code.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/dbarexpstk.svg")).to eq svg_file
      end
    end
  end
end
