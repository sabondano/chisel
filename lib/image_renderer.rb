class ImageRenderer
  def parse(input)
    change_to_image_tags(input)
  end

  def wraps_line_in_tag?(input)
    false
  end

  private

  def change_to_image_tags(input)
    if title_attr?(input)
      build_with_title_attr(input)
    else
      build_without_title_attr(input)
    end
  end

  def title_attr?(input)
    input.index(" '")
  end

  def build_with_title_attr(input)
    url        = get_url(input)
    alt_text   = get_alt_text(input)
    title_attr = get_title_attr(input)
    "<img src='#{url}' alt='#{alt_text}' title='#{title_attr}'/>"
  end

  def build_without_title_attr(input)
    url      = get_url(input)
    alt_text = get_alt_text(input)
    "<img src='#{url}' alt='#{alt_text}'/>"
  end

  def get_url(input)
    index_url_starts = input.index("(") + 1
    index_url_ends   = input.index(")") - 1
    index_url_ends   = input.index("'") - 2 if title_attr?(input)
    input[index_url_starts..index_url_ends]
  end

  def get_alt_text(input)
    index_alt_text_starts = input.index("[") + 1
    index_alt_text_ends   = input.index("]") - 1
    input[index_alt_text_starts..index_alt_text_ends]
  end

  def get_title_attr(input)
    index_title_attr_starts = input.index("'") + 1
    index_title_attr_ends   = input.index(")") - 2
    input[index_title_attr_starts..index_title_attr_ends]
  end
end