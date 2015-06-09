class StrikethroughRenderer
  def parse(input)
    if words_are_strikethrough?(input)
      input_without_tildes = strip_tildes(input)
      "<del>#{input_without_tildes}</del>"
    else
      input
    end
  end

  def wraps_line_in_tag?(input)
    words_are_strikethrough?(input)
  end

  private

  def strip_tildes(input)
    input.chars[2..-3].join("")
  end

  def words_are_strikethrough?(input)
    input[0..1] == "~~" && input[-2..-1] == "~~"
  end
end