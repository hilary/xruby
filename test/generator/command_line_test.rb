require_relative '../test_helper'

module Generator
  class CommandLineTest < Minitest::Test
    FixturePaths = Paths.new(
      metadata: 'test/fixtures/metadata',
      track: 'test/fixtures/xruby'
    )
  end
end
