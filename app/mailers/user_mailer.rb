class UserMailer < ApplicationMailer
	 default :from => 'upselectionapp@gmail.com'

	  # send a signup email to the user, pass in the user object that   contains the user's email address
	  def send_signup_email(user)
	    @user = user
	    mail( :to => @user.email,
	    :subject => 'Welcome' )
	  end

	  def send_results_email(election)
	  	@election = Election.find(election)
	  	@users = @election.users
	  		mail( :to => @users.collect(&:email).join(","),
	  	  :subject => @election.title.capitalize + ' resutls are final.' )
	  end
end
