module Zint
  RSpec.describe TelepenNum do
    describe "export" do
      it "export code" do
        telepennum_code = described_class.new(value: "012345678912")
        svg_file = telepennum_code.to_memory_file(extension: ".svg")

        File.write("spec/fixtures/telepennum.svg", svg_file) if $UPDATE_ZINT_FIXTURES
        expect(svg_file).to eq(File.read("spec/fixtures/telepennum.svg"))
      end
    end
  end
end
