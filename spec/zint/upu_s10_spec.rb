module Zint
  RSpec.describe UpuS10 do
    describe "export" do
      it "export code" do
        mailmark_code = described_class.new(value: "QA47312482PS")
        svg_file = mailmark_code.to_memory_file(extension: ".svg")

        File.write("spec/fixtures/upu_s10.svg", svg_file) if $UPDATE_ZINT_FIXTURES
        expect(svg_file).to eq(File.read("spec/fixtures/upu_s10.svg"))
      end
    end
  end
end
