class ParagraphRenderer

	def initialize(input)
		@input = input
	end

	def parse
		@input = "<p>#{@input}</p>"
	end
end