require './test/test_helper'
require 'paragraph_renderer'
require 'header_renderer'
require 'strong_renderer'
require 'emphasis_renderer'
require 'special_character_renderer'
require 'markdown_parser'

class MarkdownParserTest < Minitest::Test
	# acceptance test
	def test_if_it_parses_markdown_per_specification_example
    input_markdown = read_fixture_file("my_input_test.markdown")
    expected_output = read_fixture_file("my_output_test.html")

		result = MarkdownParser.new(input_markdown).chisel

		assert_equal normalize_whitespace(expected_output), normalize_whitespace(result)
  end

  # integration tests
  def test_it_parses_strong_inside_of_emphasis
    input = "My *emphasized and **stronged** text* is awesome."
    expected = "<p>My <em>emphasized and <strong>stronged</strong> text</em> is awesome.</p>"

    output = MarkdownParser.new(input).chisel

    assert_equal expected, output
  end

	private

  def read_fixture_file(file_name)
    absolute_path = File.join(fixtures_directory, file_name)
    File.read(absolute_path)
  end

	def fixtures_directory
		File.expand_path("../fixtures", __FILE__)
	end

	def normalize_whitespace(string)
		string.gsub(/\s+/, " ")
	end
end