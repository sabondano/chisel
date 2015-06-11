class LinkRenderer
  def parse(input)
    while links_left_to_parse?(input) do
      input = change_to_anchor_tags(input)
    end
    input
  end

  def wraps_line_in_tag?(input)
    false
  end

  def get_url(input)
    index_url_start = input.index("(") + 1
    index_url_end   = input.index(")") - 1
    input[index_url_start..index_url_end]
  end

  def get_linked_text(input)
    index_linked_text_start = input.index("[") + 1
    index_linked_text_end   = input.index("]") - 1
    input[index_linked_text_start..index_linked_text_end]
  end

  def get_text_after_link(input)
    index_unlinked_text_start = input.index(")") + 1
    index_unlinked_text_end = input.length + 1
    input[index_unlinked_text_start..index_unlinked_text_end]
  end

  def get_text_before_link(input)
    if input[0] != "["
      index_text_start = 0
      index_text_end = input.index("[") - 1
      input[index_text_start..index_text_end]
    else
      ""
    end
  end

  def change_to_anchor_tags(input)
    url = get_url(input)
    linked_text = get_linked_text(input)
    text_before_link = get_text_before_link(input)
    text_after_link = get_text_after_link(input)
    "#{text_before_link}<a href='#{url}'>#{linked_text}</a>#{text_after_link}"
  end

  def links_left_to_parse?(input)
    braces = input.chars.select do |character|
      character == "[" || character == "]" || character == "(" || character == ")"
    end
    braces.size >= 4
  end
end