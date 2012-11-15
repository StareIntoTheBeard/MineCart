class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :adminswitch

	def adminswitch
		if user_signed_in? and current_user.role? :admin 
			@adminswitch = true
		else
			@adminswitch = false
		end
	end
end
