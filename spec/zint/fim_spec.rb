module Zint
  RSpec.describe Fim do
    describe "export" do
      it "export code" do
        fim_code = described_class.new(value: "A")
        svg_file = fim_code.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/fim.svg")).to eq svg_file
      end
    end
  end
end
