require './test/test_helper'
require 'blockquote_renderer'
require 'pry'

class BlockquoteRendererTest < Minitest::Test
  def test_one_sentece_blockquote
    input = "> This is a blockquote."
    expected = "<blockquote>\n<p>This is a blockquote.</p>\n</blockquote>"

    output = BlockquoteRenderer.new.parse(input)

    assert_equal expected, output
  end

  def test_two_line_blockquote
    input = "> This is a blockquote with two lines. Lorem ipsum dolor sit amet,\n> consectetuer adipiscing elit. Aliquam hendrerit mi posuere lectus."
    expected = "<blockquote>\n<p>This is a blockquote with two lines. Lorem ipsum dolor sit amet,\nconsectetuer adipiscing elit. Aliquam hendrerit mi posuere lectus.</p>\n</blockquote>"

    output = BlockquoteRenderer.new.parse(input)

    assert_equal expected, output
  end
end