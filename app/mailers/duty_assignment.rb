class DutyAssignment < ActionMailer::Base
  default :from => "cs638khk@gmail.com"
 
  def assignment_email(user, assigned_by, duty)
    @user = user
    @assigned_by = assigned_by
    @duty = duty
    @url  = "http://orgorganizer638.herokuapp.com/duties"
    mail(:to => user.email, :subject => "ORGORGANIZER: A New Duty Has Been Assigned To You") do |format|
       format.html { render 'duty_assignment' }
       format.text { render 'duty_assignment.text' }
    end
  end
end