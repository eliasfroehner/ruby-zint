module Zint
  RSpec.describe Plessey do
    describe "export" do
      it "export code" do
        plessey_code = described_class.new(value: "012345678912")
        svg_file = plessey_code.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/plessey.svg")).to eq svg_file
      end
    end
  end
end
