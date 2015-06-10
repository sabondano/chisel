class ListRenderer
  def parse(input)
    if lines_are_unordered_list?(input)
      parse_unordered_list(input)
    elsif lines_are_ordered_list?(input)
      parse_ordered_list(input)
    else
      input
    end
  end

  def wraps_line_in_tag?(input)
    lines_are_list?(input)
  end

  private

  def parse_unordered_list(input)
    list = unordered_list_items(input)
    input_without_asterisks = strip_leading_asterisks(list)
    build_unordered_list(input_without_asterisks).join("")
  end

  def lines_are_unordered_list?(input)
    lines(input).any? do |line|
      line[0] == "*" && line.chars.count("*") < 2
    end
  end

  def parse_ordered_list(input)
    list = ordered_list_items(input)
    input_without_numbers = strip_leading_numbers(list)
    build_ordered_list(input_without_numbers).join("")
  end

  def lines_are_ordered_list?(input)
    lines(input).any? do |line|
      line[0] == line[0].to_i.to_s
    end
  end

  def lines_are_list?(input)
    lines_are_unordered_list?(input) || lines_are_ordered_list?(input)
  end

  def lines(input)
    input.split("\n")
  end

  def unordered_list_items(input)
    lines(input).select { |line| line[0] == "*"}
  end

  def ordered_list_items(input)
    lines(input).select { |line| line[0] == line[0].to_i.to_s }
  end

  def strip_leading_asterisks(list)
    list.map { |line_item| line_item[2..-1] }
  end

  def strip_leading_numbers(list)
    list.map { |line_item| line_item[3..-1] }
  end

  def build_unordered_list(input_without_asterisks)
    list = ["<ul>\n"]
    list = input_without_asterisks.reduce(list) do |list_wip, line_item|
      list_wip << "<li>#{line_item}</li>\n"
    end
    list << "</ul>"
  end

  def build_ordered_list(input_without_numbers)
    list = ["<ol>\n"]
    list = input_without_numbers.reduce(list) do |list_wip, line_item|
      list_wip << "<li>#{line_item}</li>\n"
    end
    list << "</ol>"
  end
end
