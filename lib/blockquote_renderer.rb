class BlockquoteRenderer
  def parse(input)
    if is_a_blockquote?(input)
      change_to_blockquotes(input).join("")
    else
      input
    end
  end

  def wraps_line_in_tag?(input)
    is_a_blockquote?(input)
  end

  private

  def paragraphs(input)
    input.split("\n\n")
  end

  def is_a_blockquote?(paragraph)
    paragraph[0..1] == "> "
  end

  def change_to_blockquotes(input)
    naked_blockquotes = strip_leading_block_symbols(input)
    add_blockquote_tags(naked_blockquotes)
  end


  def strip_leading_block_symbols(input)
    input.gsub("> ", "")
  end

  def add_blockquote_tags(naked_blockquotes)
    paragraphs(naked_blockquotes).map do |paragraph|
      paragraph.insert(0, "<blockquote>\n<p>")
      paragraph.insert(-1, "</p>\n</blockquote>")
    end
  end
end
