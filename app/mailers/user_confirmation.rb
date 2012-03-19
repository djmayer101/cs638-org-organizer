class UserConfirmation < ActionMailer::Base
  default :from => "notifications@example.com"
 
  def registration_email(user)
    @user = user
    @url  = "http://example.com/login"
    mail(:to => user.email, :subject => "Invited to join our OrgOrganizer")
  end
end