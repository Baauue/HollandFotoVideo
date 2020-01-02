class ApplicationController < ActionController::Base

	def rrp
    	redirect_to root_path
	end

	def rb
		redirect_back fallback_location: root_path
	end

end
