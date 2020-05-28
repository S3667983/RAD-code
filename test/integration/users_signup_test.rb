require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { users: { email: "user@invalid",
                                        password:              "foo",
                                        password_confirmation: "bar", 
                                        mobile: "123" } }
    end
    assert_temple 'users/new'
    assert_select 'div#<CSS id for error explanation'
    assert_select 'div#<CSS class for field with error'
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { email: "user@example.com",
                                        password:              "password",
                                        password_confirmation: "password",
                                        mobile: "123" } }
    end
    follow_redirect!
    assert_temple 'users/show'
    assert_not flash.FILL_IN
  end
end
