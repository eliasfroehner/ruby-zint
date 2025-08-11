module Zint
  RSpec.describe UpuS10 do
    describe "export" do
      it "export code" do
        mailmark_code = described_class.new(value: "QA47312482PS")
        svg_file = mailmark_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/upu_s10.svg")
      end
    end
  end
end
