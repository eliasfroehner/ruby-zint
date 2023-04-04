module Zint
  RSpec.describe EanxChk do
    describe "export" do
      it "export code" do
        eanxchk_code = described_class.new(value: "012345678912")
        svg_file = eanxchk_code.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/eanxchk.svg")).to eq svg_file
      end
    end
  end
end
