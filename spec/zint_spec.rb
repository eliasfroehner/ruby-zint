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
  end
end
