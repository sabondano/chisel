require_relative '../lib/markdown_parser'
require_relative '../lib/emphasis_renderer'
require_relative '../lib/header_renderer'
require_relative '../lib/link_renderer'
require_relative '../lib/list_renderer'
require_relative '../lib/paragraph_renderer'
require_relative '../lib/special_character_renderer'
require_relative '../lib/strong_renderer'

input_filename = ARGV[0]
output_filename = ARGV[1]
input = File.read(input_filename)

result = MarkdownParser.new(input).chisel
File.write(output_filename, "#{result}")
output = File.read(output_filename)

lines_input  = input.lines.count
lines_output = output.lines.count

puts "Converted #{input_filename} (#{lines_input} lines) to #{output_filename} (#{lines_output} lines)"

# SPEC SAYS IT SHOULD BE USED LIKE THIS:
# $ ruby ./lib/chisel.rb my_input.markdown my_output.html
# Converted my_input.markdown (6 lines) to my_output.html (8 lines)
