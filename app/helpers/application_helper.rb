module ApplicationHelper

	def page_title(title)
		if title.empty?
			return "Todo App"
		else
			return title
		end
	end

end