module Zint
  RSpec.describe UpuS10 do
    describe "export" do
      it "export code" do
        mailmark_code = described_class.new(value: "QA47312482PS")
        svg_file = mailmark_code.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/upu_s10.svg")).to eq svg_file
      end
    end
  end
end
