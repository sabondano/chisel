require_relative './paragraph_renderer'

class MarkdownParser
	def initialize(input)
		@markdown = input
	end

	def chisel
    per_paragraph_renderers = [
        HeaderRenderer.new
    ]
    document = ParagraphRenderer.new(@markdown, per_paragraph_renderers)
    document.parse
	end
end