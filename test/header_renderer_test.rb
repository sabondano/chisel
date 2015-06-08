require_relative 'test_helper'
require 'header_renderer'

class HeaderRendererTest < Minitest::Test
  def test_lines_which_do_not_start_with_hash_are_unchanged
    input = "This is this first sentence of the paragraph.\nThis is the second sentence of the paragraph."

    output = renderer.parse(input)

    assert_equal input, output
  end

  def test_line_with_one_hash
    input = "# This is a header"

    output = renderer.parse(input)

    expected_output = "<h1>This is a header</h1>"
    assert_equal expected_output, output
  end

  def test_line_with_two_hashes
    input = "## This is an h2"

    output = renderer.parse(input)

    expected_output = "<h2>This is an h2</h2>"
    assert_equal expected_output, output
  end

  def test_line_with_three_hashes
    input = "### This is an h3"

    output = renderer.parse(input)

    expected_output = "<h3>This is an h3</h3>"
    assert_equal expected_output, output
  end

  def test_header_containing_hash_character
    input = "# :trollface: #"

    output = renderer.parse(input)

    expected_output = "<h1>:trollface: #</h1>"
    assert_equal expected_output, output
  end

  def test_header_without_a_space_after_hashes
    input = "#:trollface:"

    output = renderer.parse(input)

    expected_output = "#:trollface:"
    assert_equal expected_output, output
  end

  def test_non_header_containing_a_hash
    input = ":trollface:# "

    output = renderer.parse(input)

    expected_output = ":trollface:# "
    assert_equal expected_output, output
  end

  private

  def renderer
    HeaderRenderer.new
  end
end