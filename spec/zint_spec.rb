RSpec.describe Zint do
  it "has a version number" do
    expect(Zint::VERSION).not_to be nil
  end

  it "has a library version number" do
    expect(Zint.library_version).to eq 21000
  end

  describe "errors" do
    it "defines error classes for error codes" do
      expect(Zint::ERROR_CLASS_FOR_RESULT).to eq({
        5 => Zint::ErrorTooLong,
        6 => Zint::ErrorInvalidData,
        7 => Zint::ErrorInvalidCheck,
        8 => Zint::ErrorInvalidOption,
        9 => Zint::ErrorEncodingProblem,
        10 => Zint::ErrorFileAccess,
        11 => Zint::ErrorMemory,
        12 => Zint::ErrorFileWrite,
        13 => Zint::ErrorUsesEci,
        14 => Zint::ErrorNoncompliant
      })
    end

    it "raises error for given error code" do
      expect { Zint.raise_error(14, "test") }.to raise_error(Zint::ErrorNoncompliant)
    end
  end

  describe "Zint FFI" do
    describe "memory functions" do
      it "calls ZBarcode_Create correctly" do
        expect(Zint.ZBarcode_Create).to be_kind_of FFI::Pointer
      end

      it "calls ZBarcode_Clear correctly" do
        zint_symbol = Zint::Structs::Symbol.new(Zint.ZBarcode_Create)

        begin
          expect { Zint.ZBarcode_Clear(zint_symbol) }.not_to raise_error
        rescue RSpec::Expectations::ExpectationNotMetError => e
          expect(e.message).not_to include "AnError"
        end
      end

      it "calls ZBarcode_Delete correctly" do
        zint_symbol = Zint::Structs::Symbol.new(Zint.ZBarcode_Create)

        begin
          expect { Zint.ZBarcode_Delete(zint_symbol) }.not_to raise_error
        rescue RSpec::Expectations::ExpectationNotMetError => e
          expect(e.message).not_to include "AnError"
        end
      end
    end

    describe "barcode generation functions" do
      require "tmpdir"
      let(:outfile) { File.join(Dir.tmpdir, "out.png") }
      let(:input_file) { "spec/fixtures/input_file.txt" }

      before do
        @zint_symbol = Zint::Structs::Symbol.new(Zint.ZBarcode_Create)
        @zint_symbol[:symbology] = Zint::BARCODE_CODE128
      end

      after do
        File.delete(outfile) if File.exist?(outfile)
      end

      it "calls ZBarcode_Encode correctly" do
        expect(Zint.ZBarcode_Encode(@zint_symbol, "value", 0)).to eq 0
      end

      it "calls ZBarcode_Encode_File correctly" do
        expect(Zint.ZBarcode_Encode_File(@zint_symbol, input_file)).to eq 0
      end

      it "calls ZBarcode_Print correctly" do
        # Prepare
        @zint_symbol[:outfile] = outfile
        Zint.ZBarcode_Encode(@zint_symbol, "value", 0)

        expect(Zint.ZBarcode_Print(@zint_symbol, 0)).to eq 0
        expect(File.exist?(outfile)).to be true
      end

      it "calls ZBarcode_Encode_and_Print correctly" do
        @zint_symbol[:outfile] = outfile
        expect(Zint.ZBarcode_Encode_and_Print(@zint_symbol, "value", 0, 0)).to eq 0
        expect(File.exist?(outfile)).to be true
      end

      it "calls ZBarcode_Encode_File_and_Print correctly" do
        @zint_symbol[:outfile] = outfile
        expect(Zint.ZBarcode_Encode_File_and_Print(@zint_symbol, input_file, 0)).to eq 0
        expect(File.exist?(outfile)).to be true
      end

      it "calls ZBarcode_Buffer correctly" do
        # Prepare
        Zint.ZBarcode_Encode(@zint_symbol, "value", 0)

        expect(Zint.ZBarcode_Buffer(@zint_symbol, 0)).to eq 0
      end

      it "calls ZBarcode_Encode_and_Buffer correctly" do
        expect(Zint.ZBarcode_Encode_and_Buffer(@zint_symbol, "value", 0, 0)).to eq 0
      end

      it "calls ZBarcode_Encode_and_Buffer correctly" do
        expect(Zint.ZBarcode_Encode_File_and_Buffer(@zint_symbol, input_file, 0)).to eq 0
      end

      it "calls ZBarcode_Buffer_Vector correctly" do
        # Prepare
        Zint.ZBarcode_Encode(@zint_symbol, "value", 0)

        expect(Zint.ZBarcode_Buffer_Vector(@zint_symbol, 0)).to eq 0
      end

      it "calls ZBarcode_Encode_and_Buffer_Vector correctly" do
        expect(Zint.ZBarcode_Encode_and_Buffer_Vector(@zint_symbol, "value", 0, 0)).to eq 0
      end

      it "calls ZBarcode_Encode_File_and_Buffer_Vector correctly" do
        expect(Zint.ZBarcode_Encode_File_and_Buffer_Vector(@zint_symbol, input_file, 0)).to eq 0
      end
    end

    describe "helper functions" do
      it "calls ZBarcode_ValidID correctly" do
        expect(Zint.ZBarcode_ValidID(Zint::BARCODE_AZTEC)).to eq true
        expect(Zint.ZBarcode_ValidID(999)).to eq false
      end

      it "calls ZBarcode_Cap correctly" do
        expect(Zint.ZBarcode_Cap(Zint::BARCODE_QRCODE, Zint::ZINT_CAP_DOTTY)).to eq 64
      end
    end
  end
end
