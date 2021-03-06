class StrongRenderer
  def parse(input)
    while has_strong?(input) do
      input = change_tags(input)
    end
    input
  end

  def wraps_line_in_tag?(input)
    false
  end

  private

  def has_strong?(input)
    double_asterisks_count = 0
    words(input).map do |word|
      double_asterisks_count += 1 if starts_with_two_asterisks?(word)
      double_asterisks_count += 1 if ends_with_two_asterisks?(word)
    end
    double_asterisks_count >= 2
  end

  def change_tags(input)
    partially_parsed = input.sub("**", "<strong>")
    partially_parsed.sub("**", "</strong>")
  end

  def words(input)
    input.split(" ")
  end

  def starts_with_two_asterisks?(word)
    word[0..1] == "**"
  end

  def ends_with_two_asterisks?(word)
    word[-2..-1] == "**"
  end
end