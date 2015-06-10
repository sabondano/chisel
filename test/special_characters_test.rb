require './test/test_helper'
require 'special_character_renderer'

class SpecialCharacterRendererTest < Minitest::Test
  def test_one_ampersand
    input = "&"
    expected = "&amp;"

    output = SpecialCharacterRenderer.new.parse(input)

    assert_equal expected, output
  end

  def test_ampersand_in_sentence
    input = "this is a test & and a half"
    expected = "this is a test &amp; and a half"

    output = SpecialCharacterRenderer.new.parse(input)

    assert_equal expected, output
  end
end