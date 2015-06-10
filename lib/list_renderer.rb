class ListRenderer
  def parse(input)
    if lines_are_list?(input)
      list = list_items(input)
      input_without_asterisks = strip_leading_asterisks(list)
      build_list(input_without_asterisks).join("")
    else
      input
    end
  end

  def wraps_line_in_tag?(input)
    lines_are_list?(input)
  end

  private

  def lines_are_list?(input)
    lines(input).any? do |line|
      line[0] == "*" && line.chars.count("*") < 2
    end
  end

  def lines(input)
    input.split("\n")
  end

  def list_items(input)
    lines(input).select { |line| line[0] == "*"}
  end

  def strip_leading_asterisks(list)
    list.map { |line_item| line_item[2..-1] }
  end

  def build_list(input_without_asterisks)
    list = ["<ul>\n"]
    list = input_without_asterisks.reduce(list) do |list_wip, line_item|
      list_wip << "<li>#{line_item}</li>\n"
    end
    list << "</ul>"
  end
end


# "<ul>\n<li>#{input[2..-1]}</li>\n</ul>"
