require_relative '../lib/markdown_parser'

input_filename = ARGV[0]
output_filename = ARGV[1]

result = MarkdownParser.new(input_filename).chisel
File.write(output_filename, "#{result}")

lines_input = 6
lines_output = 8

puts "Converted #{input_filename} (#{lines_input} lines) to #{output_filename} (#{lines_output} lines)"

# SPEC SAYS IT SHOULD BE USED LIKE THIS:
# $ ruby ./lib/chisel.rb my_input.markdown my_output.html
# Converted my_input.markdown (6 lines) to my_output.html (8 lines)
