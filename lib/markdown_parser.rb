class MarkdownParser
	def initialize(input)
		@markdown = input
	end

	def chisel
    per_paragraph_renderers = [
        HeaderRenderer.new
    ]
    ParagraphRenderer.new(@markdown, per_paragraph_renderers).parse
	end
end