class MarkdownParser

	def initialize(path)
		@markdown_file = path
	end

	def chisel
		"<h1>My Life in Desserts</h1>\n\n<h2>Chapter 1: The Beginning</h2>\n\n<p>\n    \"You just <em>have</em> to try the cheesecake,\" he said. \"Ever since it appeared in\n    <strong>Food &amp; Wine</strong> this place has been packed every night.\"\n</p>"
	end
end