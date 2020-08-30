require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'Deepesh')
  end

  test 'User should be valid' do
    assert @user.valid?
  end

  test 'username should be present' do
    @user.name = ' '
    assert_not @user.valid?
  end

  test 'name should be unique' do
    @user.save
    @user2 = User.new(name: 'Deepesh')
    assert_not @user2.valid?
  end
  # test "the truth" do
  #   assert true
  # end
end
