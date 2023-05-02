module Zint
  RSpec.describe Native do

    describe "errors" do
      it "raises error for given error code" do
        expect { described_class.raise_error(14, "test") }.to raise_error(Zint::ErrorNoncompliant)
      end
    end

    describe "Zint FFI" do
      describe "memory functions" do
        it "calls ZBarcode_Create correctly" do
          expect(described_class.ZBarcode_Create).to be_kind_of Structs::Symbol
        end

        it "calls ZBarcode_Clear correctly" do
          zint_symbol = described_class.ZBarcode_Create

          begin
            expect { described_class.ZBarcode_Clear(zint_symbol) }.not_to raise_error
          rescue RSpec::Expectations::ExpectationNotMetError => e
            expect(e.message).not_to include "AnError"
          end
        end

        it "calls ZBarcode_Delete correctly" do
          zint_symbol = described_class.ZBarcode_Create

          begin
            # free is called here instead of ZBarcode_Delete, since the GC would double free the Symbol otherwise.
            expect { described_class.pointer.free }.not_to raise_error
          rescue RSpec::Expectations::ExpectationNotMetError => e
            expect(e.message).not_to include "AnError"
          end
        end
      end

      describe "barcode generation functions" do
        require "tmpdir"
        let(:outfile) { File.join(Dir.tmpdir, "out.svg") }
        let(:input_file) { "spec/fixtures/input_file.txt" }

        before do
          @zint_symbol = described_class.ZBarcode_Create
          @zint_symbol[:symbology] = Zint::BARCODE_CODE128
        end

        after do
          File.delete(outfile) if File.exist?(outfile)
        end

        it "calls ZBarcode_Encode correctly" do
          expect(described_class.ZBarcode_Encode(@zint_symbol, "value", 0)).to eq 0
        end

        it "calls ZBarcode_Encode_File correctly" do
          expect(described_class.ZBarcode_Encode_File(@zint_symbol, input_file)).to eq 0
        end

        it "calls ZBarcode_Print correctly" do
          # Prepare
          @zint_symbol[:outfile] = outfile
          described_class.ZBarcode_Encode(@zint_symbol, "value", 0)

          expect(described_class.ZBarcode_Print(@zint_symbol, 0)).to eq 0
          expect(File.exist?(outfile)).to be true
        end

        it "calls ZBarcode_Encode_and_Print correctly" do
          @zint_symbol[:outfile] = outfile
          expect(described_class.ZBarcode_Encode_and_Print(@zint_symbol, "value", 0, 0)).to eq 0
          expect(File.exist?(outfile)).to be true
        end

        it "calls ZBarcode_Encode_File_and_Print correctly" do
          @zint_symbol[:outfile] = outfile
          expect(described_class.ZBarcode_Encode_File_and_Print(@zint_symbol, input_file, 0)).to eq 0
          expect(File.exist?(outfile)).to be true
        end

        it "calls ZBarcode_Buffer correctly" do
          # Prepare
          described_class.ZBarcode_Encode(@zint_symbol, "value", 0)

          expect(described_class.ZBarcode_Buffer(@zint_symbol, 0)).to eq 0
        end

        it "calls ZBarcode_Encode_and_Buffer correctly" do
          expect(described_class.ZBarcode_Encode_and_Buffer(@zint_symbol, "value", 0, 0)).to eq 0
        end

        it "calls ZBarcode_Encode_and_Buffer correctly" do
          expect(described_class.ZBarcode_Encode_File_and_Buffer(@zint_symbol, input_file, 0)).to eq 0
        end

        it "calls ZBarcode_Buffer_Vector correctly" do
          # Prepare
          described_class.ZBarcode_Encode(@zint_symbol, "value", 0)

          expect(described_class.ZBarcode_Buffer_Vector(@zint_symbol, 0)).to eq 0
        end

        it "calls ZBarcode_Encode_and_Buffer_Vector correctly" do
          expect(described_class.ZBarcode_Encode_and_Buffer_Vector(@zint_symbol, "value", 0, 0)).to eq 0
        end

        it "calls ZBarcode_Encode_File_and_Buffer_Vector correctly" do
          expect(described_class.ZBarcode_Encode_File_and_Buffer_Vector(@zint_symbol, input_file, 0)).to eq 0
        end
      end

      describe "helper functions" do
        it "calls ZBarcode_ValidID correctly" do
          expect(described_class.ZBarcode_ValidID(Zint::BARCODE_AZTEC)).to eq true
          expect(described_class.ZBarcode_ValidID(999)).to eq false
        end

        it "calls ZBarcode_Cap correctly" do
          expect(described_class.ZBarcode_Cap(Zint::BARCODE_QRCODE, Zint::ZINT_CAP_DOTTY)).to eq 64
        end
      end
    end
  end
end
