require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/markdown_parser'

class MarkdownParserTest < Minitest::Test
	# acceptance test
	def test_if_it_parses_markdown_per_specification_example
		skip
		result = MarkdownParser.new("my_input_test.markdown").chisel
		example_file_path = File.join(fixtures_directory, "my_output_test.html")
		example = File.read(example_file_path)

		assert_equal normalize_whitespace(example), normalize_whitespace(result)
	end

	private

	def fixtures_directory
		File.expand_path("../fixtures", __FILE__)
	end

	def normalize_whitespace(string)
		string.gsub(/\s+/, " ")
	end
end