module Zint
  RSpec.describe Hibc128 do
    describe "export" do
      it "export code" do
        hibc128_code = described_class.new(value: "012345678912")
        svg_file = hibc128_code.to_memory_file(extension: ".svg")

        hibc128_code = described_class.new(value: "012345678912")
        hibc128_code.to_file(path: "spec/fixtures/hibc128.svg")
        File.write("spec/fixtures/hibc128.svg", svg_file) if $UPDATE_ZINT_FIXTURES
        expect(svg_file).to eq(File.read("spec/fixtures/hibc128.svg"))
      end
    end
  end
end
