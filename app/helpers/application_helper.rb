module ApplicationHelper

	def page_title(title)
		if title.empty?
			"Todo App"
		else
			title
		end
	end

end