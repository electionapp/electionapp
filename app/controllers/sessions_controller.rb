class SessionsController < Clearance::SessionsController
	def new
		super
	end

	def url_after_destroy
    	login_url
  	end

end