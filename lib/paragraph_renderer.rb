class ParagraphRenderer

	def initialize(input)
		@markdown = input
	end

	def parse
		wrapped_paragraphs.join("\n")
	end

	private

	def wrapped_paragraphs
		paragraphs.map do |paragraph|
			"<p>#{paragraph}</p>"
		end
	end

	def paragraphs
		@markdown.split("\n\n")
	end
end




