class EmphasisRenderer
  def parse(input)
    while has_emphasis?(input) do
      input = change_tags(input)
    end
    input
  end

  def wraps_line_in_tag?(input)
    false
  end

  private

  def has_emphasis?(input)
    asterisk_count = 0
    words(input).map do |word|
      asterisk_count += 1 if starts_with_one_asterisk?(word)
      asterisk_count += 1 if ends_with_one_asterisk?(word)
    end
    true if asterisk_count >= 2
  end

  def change_tags(input)
    partially_parsed = input.sub("*", "<em>")
    partially_parsed.sub("*", "</em>")
  end

  def words(input)
    input.split(" ")
  end

  def starts_with_one_asterisk?(word)
    word[0] == "*"
  end

  def ends_with_one_asterisk?(words)
  words[-1] == "*"
  end

end