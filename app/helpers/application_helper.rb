module ApplicationHelper

	def title(page_title)
		content_for :title, page_title.to_s
	end

	def css(css)
		content_for :view_specific_css, css.to_s
	end

end