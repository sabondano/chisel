require './test/test_helper'
require 'list_renderer'

class ListsRendererTest < Minitest::Test
  def test_a_list_with_one_item
    input = "* this is a list item"
    expected = "<ul>\n<li>this is a list item</li>\n</ul>"

    output = ListRenderer.new.parse(input)

    assert_equal expected, output
  end

  def test_a_list_with_two_items
    input = "* this is the first list item\n* this is the second list item"
    expected = "<ul>\n<li>this is the first list item</li>\n<li>this is the second list item</li>\n</ul>"

    output = ListRenderer.new.parse(input)

    assert_equal expected, output
  end

  def test_a_list_with_three_items
    input = "* this is the first list item\n* this is the second list item\n* this is the third list item"
    expected = "<ul>\n<li>this is the first list item</li>\n<li>this is the second list item</li>\n<li>this is the third list item</li>\n</ul>"

    output = ListRenderer.new.parse(input)

    assert_equal expected, output
  end
end
