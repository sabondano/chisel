require './test/test_helper'
require 'code_block_renderer'

class CodeBlockRendererTest < Minitest::Test
  def test_one_line_code_block
    input = "    This is a code block."
    expected = "<pre><code>This is a code block.\n</code></pre>"

    output = CodeBlockRenderer.new.parse(input)

    assert_equal expected, output
  end
end