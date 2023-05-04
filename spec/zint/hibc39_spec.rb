module Zint
  RSpec.describe Hibc39 do
    describe "export" do
      it "export code" do
        hibc39_code = described_class.new(value: "012345678912")
        svg_file = hibc39_code.to_memory_file(extension: ".svg")

        hibc39_code = described_class.new(value: "012345678912")
        hibc39_code.to_file(path: "spec/fixtures/hibc39.svg")
        expect(File.read("spec/fixtures/hibc39.svg")).to eq svg_file
      end
    end
  end
end
