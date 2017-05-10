require_relative '../test_helper'

module Generator
  class CommandLineTest < Minitest::Test
    FixturePaths = Paths.new(
      metadata: 'test/fixtures/metadata',
      track: 'test/fixtures/xruby'
    )

    def test_parse_single
      options = %w(alpha)
      expected = ['alpha']
      result = CommandLine.new(FixturePaths).parse(options)
      assert_equal expected, result.map(&:exercise_name)
    end

    def test_parse_all
      options = %w(--all)
      expected = %w(alpha beta)
      result = CommandLine.new(FixturePaths).parse(options)
      assert_equal expected, result.map(&:exercise_name)
    end

    def test_parse_freeze
      options = %w(--freeze alpha)
      expected = [Generator::GenerateTests]
      result = CommandLine.new(FixturePaths).parse(options)
      assert_equal expected, result.map(&:class)
    end

    def test_parse_no_freeze
      options = %w(alpha)
      expected = [Generator::UpdateVersionAndGenerateTests]
      result = CommandLine.new(FixturePaths).parse(options)
      assert_equal expected, result.map(&:class)
    end
  end
end
