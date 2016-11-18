class UsersController < Clearance::UsersController
	def new
		super
	end

	def elections
		@User.elections
	end
	
end
