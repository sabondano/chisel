class ParagraphRenderer

	def initialize(input)
		@markdown = input
	end

	def parse
		if # less than two new line characters in a row
			@html = "<p>#{@markdown}</p>"
		else
			# do something magic here
	end
end




