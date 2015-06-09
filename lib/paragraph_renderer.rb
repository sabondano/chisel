class ParagraphRenderer

	def initialize(input, per_paragraph_renderers=[])
		@markdown = input
    @per_paragraph_renderers = per_paragraph_renderers
	end

	def parse
		wrapped_paragraphs.join("\n")
	end

	private

	def wrapped_paragraphs
		paragraphs.map do |paragraph|
      parsed = parse_paragraph(paragraph)
      unless @per_paragraph_renderers.any? { |r| r.wraps_line_in_tag?(paragraph) }
        parsed = "<p>#{parsed}</p>"
      end
      parsed
		end
	end

	def paragraphs
		@markdown.split("\n\n")
  end

  def parse_paragraph(paragraph)
    @per_paragraph_renderers.reduce(paragraph) do |renderer, partially_parsed|
      renderer.parse(partially_parsed)
    end
  end
end




