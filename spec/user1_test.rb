require 'spec_helper.rb'

describe User do

#Before each test runs, run this:
#  before :each do
#    user = User.new "John", "Doe" , "BigDoe@gmail.com", "hunter2" 
#  end


  #t’s a convention in Ruby to talk refer to instance methods 
  #like this: ClassName#methodName 
  describe "#new" do
    it "Takes 4 params and returns a User object" do
    	user = User.new("John", "Doe" , "BigDoe@gmail.com", "hunter2") 
	user.should be_an_instance_of User
    end
  end

end
