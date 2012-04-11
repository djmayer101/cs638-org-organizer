class UserConfirmation < ActionMailer::Base
  default :from => "notifications@example.com"
 
  def registration_email(user)
    @user = user
    @url  = "http://example.com/login"
    mail(:to => user.email, :subject => "Invited to join our OrgOrganizer") do |format|
       format.html { render 'user_confirmation' }
       format.text { render :text => 'Render text' }
    end
  end
end