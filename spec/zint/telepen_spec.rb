module Zint
  RSpec.describe Telepen do
    describe "export" do
      it "export code" do
        telepen_code = described_class.new(value: "012345678912")
        svg_file = telepen_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/telepen.svg")
      end
    end
  end
end
