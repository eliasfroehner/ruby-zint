module Zint
  RSpec.describe Logmars do
    describe "export" do
      it "export code" do
        logmars_code = described_class.new(value: "012345678912")
        svg_file = logmars_code.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/logmars.svg")).to eq svg_file
      end
    end
  end
end
