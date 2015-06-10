class SpecialCharacterRenderer
  def parse(input)
    input.gsub("&", "&amp;")
  end

  def wraps_line_in_tags?(input)
    false
  end

end



# iterate through each word
# if an ampersand is found change it to the correct word