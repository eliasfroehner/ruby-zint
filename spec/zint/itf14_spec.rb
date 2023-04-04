module Zint
  RSpec.describe Itf14 do
    describe "export" do
      it "export code" do
        itf14_code = described_class.new(value: "012345678912")
        svg_file = itf14_code.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/itf14.svg")).to eq svg_file
      end
    end
  end
end
