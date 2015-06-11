class CodeBlockRenderer
  def parse(input)
    if is_a_code_block?(input)
      change_to_code_block_tags(input)
    else
      input
    end
  end

  def wraps_line_in_tag?(input)
    is_a_code_block?(input)
  end

  private

  def is_a_code_block?(input)
    input[0..3] == "    "
  end

  def change_to_code_block_tags(input)
    naked_blockquotes = strip_leading_spaces(input)
    add_code_block_tags(naked_blockquotes)
  end


  def strip_leading_spaces(input)
    input.gsub("    ", "")
  end

  def add_code_block_tags(block)
      block.insert(0, "<pre><code>")
      block.insert(-1, "\n</code></pre>")
  end
end