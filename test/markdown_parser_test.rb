require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/markdown_parser'

class MarkdownParserTest < Minitest::Test
	# acceptance test
	def test_if_it_parses_markdown_per_specification_example
		result = MarkdownParser.new("my_input_test.markdown").chisel
		example = File.read("#{Dir.pwd}/test/my_output_test.html")

		assert_equal example, result
	end
end