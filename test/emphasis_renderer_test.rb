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

  def test_multiple_elements_wrapped_in_differente_sets_of_asterisks
    input = "*this* is a *test* and *something*"
    expected = "<em>this</em> is a <em>test</em> and <em>something</em>"

    output = EmphasisRenderer.new.parse(input)

    assert_equal expected, output
  end

  def test_sentence_with_one_word_wrapped_in_asterisks
    input = "This is a simple sentence with one word *emphasized*"
    expected = "This is a simple sentence with one word <em>emphasized</em>"

    output = EmphasisRenderer.new.parse(input)

    assert_equal expected, output
  end

  def test_has_emphasis_method_workd_with_input_that_includes_one_asterisk
    input = "* this is a line item"
    expected = "* this is a line item"

    output = EmphasisRenderer.new.parse(input)

    assert_equal expected, output
  end
end