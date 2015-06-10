class MarkdownParser
	def initialize(input)
		@markdown = input
	end

	def chisel
    per_paragraph_renderers = [
        HeaderRenderer.new,
        StrongRenderer.new,
        ListRenderer.new,
        EmphasisRenderer.new,
        LinkRenderer.new,
        SpecialCharacterRenderer.new
    ]
    ParagraphRenderer.new(@markdown, per_paragraph_renderers).parse
	end
end