module Zint
  RSpec.describe C25standard do
    describe "export" do
      it "export code" do
        c25standard_code = described_class.new(value: "012345678912")
        svg_file = c25standard_code.to_memory_file(extension: ".svg")

        File.write("spec/fixtures/c25standard.svg", svg_file) if $UPDATE_ZINT_FIXTURES
        expect(svg_file).to eq(File.read("spec/fixtures/c25standard.svg"))
      end
    end
  end
end
