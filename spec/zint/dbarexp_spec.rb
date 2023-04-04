module Zint
  RSpec.describe DbarExp do
    describe "export" do
      it "export code" do
        dbarexp_code = described_class.new(value: "[01]98898765432106[3202]012345[15]991231")
        svg_file = dbarexp_code.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/dbarexp.svg")).to eq svg_file
      end
    end
  end
end
