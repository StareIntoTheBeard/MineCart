module ApplicationHelper
	def make_me_a_pretty_sald(content)
		auto_link(BlueCloth.new(content).to_html.html_safe)
	end
end
