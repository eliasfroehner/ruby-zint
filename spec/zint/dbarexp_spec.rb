module Zint
  RSpec.describe DbarExp do
    describe "export" do
      it "export code" do
        dbarexp_code = described_class.new(value: "[01]98898765432106[3202]012345[15]991231")
        svg_file = dbarexp_code.to_memory_file(extension: ".svg")

        expect_svg_file(svg_file, "spec/fixtures/dbarexp.svg")
      end
    end
  end
end
