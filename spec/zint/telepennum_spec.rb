module Zint
  RSpec.describe TelepenNum do
    describe "export" do
      it "export code" do
        telepennum_code = described_class.new(value: "012345678912")
        svg_file = telepennum_code.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/telepennum.svg")).to eq svg_file
      end
    end
  end
end
