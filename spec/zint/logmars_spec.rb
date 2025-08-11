module Zint
  RSpec.describe Logmars do
    describe "export" do
      it "export code" do
        logmars_code = described_class.new(value: "012345678912")
        svg_file = logmars_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/logmars.svg")
      end
    end
  end
end
