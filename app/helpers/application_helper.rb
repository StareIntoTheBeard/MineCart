module ApplicationHelper
	def make_me_a_pretty_sald(content)
		auto_link(BlueCloth.new(content).to_html.html_safe)
	end

	def currentstore
		if user_signed_in? and current_user.role? :admin
			return current_user.store_id
		else
			1

			end
	end
end
