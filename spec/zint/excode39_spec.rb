module Zint
  RSpec.describe Excode39 do
    describe "export" do
      it "export code" do
        excode39_code = described_class.new(value: "012345678912")
        svg_file = excode39_code.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/excode39.svg")).to eq svg_file
      end
    end
  end
end
