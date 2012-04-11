require_relative '../spec_helper.rb'



describe "UserConfirmationMailer" do
  
describe 'instructions' do
    let(:user) { mock_model(User, :first_name => 'Lucas', :email => 'lucas@email.com', :password => "1234abc") }
    let(:mail) { UserConfirmation.registration_email(user, user.password) }
 
    #ensure that the subject is correct
    it 'renders the subject' do
      mail.subject.should == 'Invited to join our OrgOrganizer'
    end
 
    #ensure that the receiver is correct
    it 'renders the receiver email' do
      mail.to.should == [user.email]
    end
 
    #ensure that the sender is correct
    it 'renders the sender email' do
      mail.from.should == ['notifications@example.com']
    end
 
    #ensure that the @name variable appears in the email body
    it 'assigns @name' do
      mail.body.encoded.should match(user.first_name)
    end
 
    it 'renders the users password' do
      mail.body.encoded.should match(user.password)
    end
    #ensure that the @confirmation_url variable appears in the email body
    it 'assigns @confirmation_url' do
      mail.body.encoded.should match("http://example.com/login")
    end
  end
end