module Zint
  RSpec.describe UspsImail do
    describe "export" do
      it "export code" do
        uspsimail_code = described_class.new(value: "01234567890123456789")
        svg_file = uspsimail_code.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/uspsimail.svg")).to eq svg_file
      end
    end
  end
end
