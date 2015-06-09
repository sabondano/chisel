class EmphasisRenderer
  def parse(input)
    if words_are_emphasized?(input)
      emphasized_part = input[/\*.+\*/]
      input_without_asterisks = strip_asterisks(emphasized_part)
      input.gsub(/\*.+\*/, "<em>#{input_without_asterisks}</em>")
    else
      input
    end
  end

  def wraps_line_in_tag?(input)
    false
  end

  private

  def strip_asterisks(input)
    input.chars[1..-2].join("")
  end

  def words_are_emphasized?(input)
    input.chars.count("*") >= 2 && (words_are_strong?(input) == false)
  end

  def words_are_strong?(input)
    @strong = false
    input.chars.each_cons(2) do |element|
      @strong = true if element[0] == element[1]
    end
    @strong
  end
end

