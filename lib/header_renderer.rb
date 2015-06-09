class HeaderRenderer
  def parse(input)
    if line_is_a_header?(input)
      number_of_hashes = count_leading_hashes(input)
      input_without_hashes = strip_leading_hashes(input)
      "<h#{number_of_hashes}>#{input_without_hashes}</h#{number_of_hashes}>"
    else
      input
    end
  end

  def wraps_line_in_tag?(input)
    line_is_a_header?(input)
  end

  private

  def count_leading_hashes(input)
    hashes(input).length
  end

  def strip_leading_hashes(input)
    words(input).join(" ")
  end

  def hashes(input)
    input.split(" ").first
  end

  def words(input)
    input.split(" ").drop(1)
  end

  def line_is_a_header?(input)
    input =~ /^#+ /
  end
end