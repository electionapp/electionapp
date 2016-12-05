class UsersController < Clearance::UsersController
	def new
		super
	end

def show
end

def destroy
	User.find(params[:id]).destroy
	redirect_to root_path
end

	def elections
		@User.elections
	end

end
