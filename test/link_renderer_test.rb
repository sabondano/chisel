require './test/test_helper'
require 'link_renderer'

class LinkRendererTest < Minitest::Test
  def test_a_simple_url
    input = "[This link](http://example.net/) has no title attribute."
    expected = "<a href='http://example.net/'>This link</a> has no title attribute."

    output = LinkRenderer.new.parse(input)

    assert_equal expected, output
  end

  def test_a_simple_url_with_text_before_the_link
    input = "follow [This link](http://example.net/)"
    expected = "follow <a href='http://example.net/'>This link</a>"

    output = LinkRenderer.new.parse(input)

    assert_equal expected, output
  end

  def test_multiple_urls_in_one_line
    input = "[this link](http://example.net/) and [another link](http://example2.com/)"
    expected = "<a href='http://example.net/'>this link</a> and <a href='http://example2.com/'>another link</a>"

    output = LinkRenderer.new.parse(input)

    assert_equal expected, output
  end

  def test_get_url
    input = "[This link](http://example.net/)"
    expected = "http://example.net/"

    output = LinkRenderer.new.get_url(input)

    assert_equal expected, output
  end

  def test_get_linked_text
    input = "[This link](http://example.net/)"
    expected = "This link"

    output = LinkRenderer.new.get_linked_text(input)

    assert_equal expected, output
  end

  def test_get_unlinked_text
    input = "[This link](http://example.net/) has no title attribute."
    expected = " has no title attribute."

    output = LinkRenderer.new.get_text_after_link(input)

    assert_equal expected, output
  end


end