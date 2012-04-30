class UserConfirmation < ActionMailer::Base
  default :from => "cs638khk@gmail.com"
 
  def registration_email(user, password)
    @user = user
    @url  = "http://orgorganizer638.herokuapp.com/users/sign_in"
    @password = password
    mail(:to => user.email, :subject => "Invited to join our OrgOrganizer") do |format|
       format.html { render 'user_confirmation' }
       format.text { render 'user_confirmation.text' }
    end
  end
end