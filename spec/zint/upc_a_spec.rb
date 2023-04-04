module Zint
  RSpec.describe UpcA do
    describe "export" do
      it "export code" do
        upca_code = described_class.new(value: "012345678912")
        svg_file = upca_code.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/upca.svg")).to eq svg_file
      end
    end
  end
end
