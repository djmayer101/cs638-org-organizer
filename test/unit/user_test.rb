require 'spec_helper.rb' 

class UserTest < ActiveSupport::TestCase
  fixtures :users
  def test_add_user
    test "Attempting to add a user to database" do
      user = User.new :first_name => users(:one).first_name,
      :last_name  => users(:one).last_name,
      :password   => users(:one).password,
      :email      => users(:one).email
      assert user.save
      user_copy = User.find(user.id)
      assert_equal user.first_name, user_copy.first_name
      assert user.save
      assert user.destroy
    end
  end
end

# test "the truth" do
#   assert true
# end

