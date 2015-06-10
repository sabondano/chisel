require './test/test_helper'
require 'strong_renderer'
class StrongRendererTest < Minitest::Test
  def test_words_wrapped_in_two_consecutive_asterisks
    input = "**this is a test**"
    expected = "<strong>this is a test</strong>"

    output = StrongRenderer.new.parse(input)

    assert_equal expected, output
  end

  def test_a_sentence_with_group_of_words_wrapped_in_two_consecutive_asterisks
    input = "This is a **test** now for real!"
    expected = "This is a <strong>test</strong> now for real!"

    output = StrongRenderer.new.parse(input)

    assert_equal expected, output
  end

  def test_a_sentence_with_multiple_stronged_words
    input = "This is a **test** and here is **another**"
    expected = "This is a <strong>test</strong> and here is <strong>another</strong>"

    output = StrongRenderer.new.parse(input)

    assert_equal expected, output
  end

  def test_a_sentence_with_a_lot_of_stronged_words
    input = "**This** is a **test** and **here** is **another**"
    expected = "<strong>This</strong> is a <strong>test</strong> and <strong>here</strong> is <strong>another</strong>"

    output = StrongRenderer.new.parse(input)

    assert_equal expected, output
  end
end