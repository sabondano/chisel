require 'pry'
class StrongRenderer
  def parse(input)
    if has_strong?(input)
      partially_parsed = input.sub("**", "<strong>")
      partially_parsed.sub("**", "</strong>")
    else
      input
    end
  end

  def has_strong?(input)
    double_asterisks_count = 0
    words(input).map do |word|
      double_asterisks_count += 1 if starts_with_two_asterisks?(word)
      double_asterisks_count += 1 if ends_with_two_asterisks?(word)
    end
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