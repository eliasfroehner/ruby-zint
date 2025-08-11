module Zint
  RSpec.describe Azrune do
    describe "export" do
      it "export code" do
        azrune_code = described_class.new(value: "123")
        svg_file = azrune_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/azrune.svg")
      end
    end
  end
end
