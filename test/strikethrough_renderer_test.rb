require './test/test_helper'
require 'strikethrough_renderer'

class StrikethroughRendererTest < Minitest::Test
  def test_single_word_without_two_tildes_at_start_and_end
    input = "test"
    expected = "test"

    output = StrikethroughRenderer.new.parse(input)

    assert_equal expected, output
  end

  def test_single_word_with_two_tildes_at_start_and_end
    input = "~~test~~"
    expected = "<del>test</del>"

    output = StrikethroughRenderer.new.parse(input)

    assert_equal expected, output
  end

  def test_multiple_words_with_two_tildes_at_start_and_end
    input = "~~Mistaken text what?~~"
    expected = "<del>Mistaken text what?</del>"

    output = StrikethroughRenderer.new.parse(input)

    assert_equal expected, output
  end
end