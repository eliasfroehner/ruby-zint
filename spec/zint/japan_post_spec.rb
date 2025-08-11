module Zint
  RSpec.describe JapanPost do
    describe "export" do
      it "export code" do
        japanpost_code = described_class.new(value: "012345678912")
        svg_file = japanpost_code.to_memory_file(extension: ".svg")

        File.write("spec/fixtures/japanpost.svg", svg_file) if $UPDATE_ZINT_FIXTURES
        expect(svg_file).to eq(File.read("spec/fixtures/japanpost.svg"))
      end
    end
  end
end
