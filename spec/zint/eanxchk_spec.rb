module Zint
  RSpec.describe EanxChk do
    describe "export" do
      it "export code" do
        eanxchk_code = described_class.new(value: "012345678912")
        svg_file = eanxchk_code.to_memory_file(extension: ".svg")

        File.write("spec/fixtures/eanxchk.svg", svg_file) if $UPDATE_ZINT_FIXTURES
        expect(svg_file).to eq(File.read("spec/fixtures/eanxchk.svg"))
      end
    end
  end
end
