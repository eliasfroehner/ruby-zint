module Zint
  RSpec.describe DataMatrix do
    describe "type" do
      it "supports only DataMatrix types" do
        expect { described_class.new(value: "Test", type: Zint::BARCODE_DATAMATRIX) }.not_to raise_error
        expect { described_class.new(value: "Test", type: Zint::BARCODE_HIBC_DM) }.not_to raise_error
      rescue RSpec::Expectations::ExpectationNotMetError => e
        expect(e.message).not_to include "AnError"
      end
      it "raises error on invalid type" do
        expect { described_class.new(value: "Test", type: Zint::BARCODE_AZTEC) }.to raise_error ArgumentError
      end
    end

    describe "export" do
      it "export DataMatrix code" do
        dm_code = described_class.new(value: "/ACMRN123456/V200912190833")
        svg_file = dm_code.to_memory_file(extension: ".svg")

        expect(File.read("spec/fixtures/data_matrix.svg")).to eq svg_file
      end
    end
  end
end
