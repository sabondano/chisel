require './test/test_helper'
require 'paragraph_renderer'

class ParagraphRendererTest < Minitest::Test
	def test_a_one_line_chunk_of_text_not_starting_with_hash_character_is_turned_into_a_paragraph
		result = ParagraphRenderer.new("This is the first line of the paragraph.").parse

		assert_equal "<p>This is the first line of the paragraph.</p>", result
	end
	
	def test_a_two_line_chunk_of_text_not_starting_with_hash_character_is_turned_into_a_paragraph
		two_line_paragraph = "This is the first line of the paragraph.\nThis is the second line of the same paragraph."
		result = ParagraphRenderer.new(two_line_paragraph).parse
		html = "<p>This is the first line of the paragraph.\nThis is the second line of the same paragraph.</p>"

		assert_equal html, result
	end

	def test_two_chunks_of_text_with_two_line_breaks_are_turned_into_two_paragraphs
		two_paragraphs = "This is the first line of the first paragraph.\n\nThis is the first line of the second paragraph."
		result = ParagraphRenderer.new(two_paragraphs).parse
		html = "<p>This is the first line of the first paragraph.</p>\n<p>This is the first line of the second paragraph.</p>"

		assert_equal html, result
	end
end
