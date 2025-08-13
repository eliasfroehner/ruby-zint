module Zint
  RSpec.describe Fim do
    describe "export" do
      it "export code" do
        fim_code = described_class.new(value: "A")
        svg_file = fim_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/fim.svg")
      end
    end
  end
end
