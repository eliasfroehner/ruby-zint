require "tmpdir"

require "simplecov"
SimpleCov.start do
  add_filter "/spec/"
end

require "zint"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  # Helpers

  # Determines whether fixture files should be updated during test runs.
  # When enabled, test methods will write new fixture files.
  # This is useful for regenerating test fixtures when the expected output changes.
  #
  # @return [Boolean] false by default, preventing accidental fixture updates
  def update_zint_fixtures
    false
  end

  # Compares SVG content against a fixture file or updates the fixture if update mode is enabled.
  # If update_zint_fixtures returns true, writes the SVG content to the fixture file.
  # Otherwise, asserts that the SVG content matches the existing fixture file content.
  #
  # @param svg_content [String] the generated SVG content to compare
  # @param fixture_svg_path [String] path to the SVG fixture file
  # @return [void]
  # @raise [RSpec::Expectations::ExpectationNotMetError] if content doesn't match fixture
  def expect_svg_file(svg_content, fixture_svg_path)
    File.write(fixture_svg_path, svg_content) if update_zint_fixtures
    expect(svg_content).to eq(File.read(fixture_svg_path))
  end

  # Compares PNG file content against a fixture file or updates the fixture if update mode is enabled.
  # If update_zint_fixtures returns true, copies the PNG file to the fixture location.
  # Otherwise, asserts that the PNG file content matches the existing fixture file content.
  #
  # @param png_path [String] path to the generated PNG file to compare
  # @param fixture_png_path [String] path to the PNG fixture file
  # @return [void]
  # @raise [RSpec::Expectations::ExpectationNotMetError] if file contents don't match
  def expect_png_file(png_path, fixture_png_path)
    File.binwrite(fixture_png_path, File.binread(png_path)) if update_zint_fixtures
    expect(File.binread(png_path)).to eq File.binread(fixture_png_path)
  end
end
