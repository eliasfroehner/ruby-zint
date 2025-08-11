module Zint
  RSpec.describe Hibc39 do
    describe "export" do
      it "export code" do
        hibc39_code = described_class.new(value: "012345678912")
        svg_file = hibc39_code.to_memory_file(extension: ".svg")

        hibc39_code = described_class.new(value: "012345678912")
        hibc39_code.to_file(path: "spec/fixtures/hibc39.svg")
        File.write("spec/fixtures/hibc39.svg", svg_file) if $UPDATE_ZINT_FIXTURES
        expect(svg_file).to eq(File.read("spec/fixtures/hibc39.svg"))
      end
    end
  end
end
