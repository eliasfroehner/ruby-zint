module Zint
  RSpec.describe Stdout do
    describe "export" do
      it "export code" do
        stdout_code = described_class.new(value: "012345678912")
        svg_file = stdout_code.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/stdout.svg")).to eq svg_file
      end
    end
  end
end
