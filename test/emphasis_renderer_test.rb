require './test/test_helper'
require 'emphasis_renderer'

class EmphasisRendererTest < Minitest::Test
  def test_one_word_wrapped_in_asterisks
    input = "*emphasized*"
    expected = "<em>emphasized</em>"

    output = EmphasisRenderer.new.parse(input)

    assert_equal expected, output
  end

  def test_multiple_words_wrapped_in_asterisks
    input = "*this text is emphasized*"
    expected = "<em>this text is emphasized</em>"

    output = EmphasisRenderer.new.parse(input)

    assert_equal expected, output
  end

  def test_sentence_with_one_word_wrapped_in_asterisks
    input = "This is a simple sentence with one word *emphasized*"
    expected = "This is a simple sentence with one word <em>emphasized</em>"

    output = EmphasisRenderer.new.parse(input)

    assert_equal expected, output
  end
end