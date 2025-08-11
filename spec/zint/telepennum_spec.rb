module Zint
  RSpec.describe TelepenNum do
    describe "export" do
      it "export code" do
        telepennum_code = described_class.new(value: "012345678912")
        svg_file = telepennum_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/telepennum.svg")
      end
    end
  end
end
