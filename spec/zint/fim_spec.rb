module Zint
  RSpec.describe Fim do
    describe "export" do
      it "export code" do
        fim_code = described_class.new(value: "A")
        svg_file = fim_code.to_memory_file(extension: ".svg")

        File.write("spec/fixtures/fim.svg", svg_file) if $UPDATE_ZINT_FIXTURES
        expect(svg_file).to eq(File.read("spec/fixtures/fim.svg"))
      end
    end
  end
end
