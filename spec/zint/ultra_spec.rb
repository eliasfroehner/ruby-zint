module Zint
  RSpec.describe Ultra do
    describe "export" do
      it "export code" do
        ultra_code = described_class.new(value: "012345678912")
        svg_file = ultra_code.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/ultra.svg")).to eq svg_file
      end
    end
  end
end
