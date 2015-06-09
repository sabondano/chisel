require_relative 'test_helper'
require 'paragraph_renderer'
require 'header_renderer'
require 'markdown_parser'

class MarkdownParserTest < Minitest::Test
	# acceptance test
	def test_if_it_parses_markdown_per_specification_example
    skip
    input_markdown = read_fixture_file("my_input_test.markdown")
    expected_output = read_fixture_file("my_output_test.html")

		result = MarkdownParser.new(input_markdown).chisel

		assert_equal normalize_whitespace(expected_output), normalize_whitespace(result)
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