require 'test_helper'

class CreateUsersControllerTest < ActionDispatch::IntegrationTest
  test 'get user form and create user' do
    get new_user_path
    assert_template 'users/new'
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name: 'Deepesh' } }
      follow_redirect!
    end
    assert_template 'users/show'
    assert_match 'Deepesh', response.body
  end
  # test "the truth" do
  #   assert true
  # end
end
