module ApplicationHelper

	def title(page_title)
		content_for :title, page_title.to_s
	end

	def css(css)
		content_for :view_specific_css, css.to_s
	end

	def gravatar_for(user)
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=32"
		link_to image_tag(gravatar_url, alt: user.name), profile_path
	end
	
end