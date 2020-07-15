require 'test_helper'

class SignUpUserTest < ActionDispatch::IntegrationTest
  test 'it signs up a user passing valid data' do
    assert_difference 'User.count' do
      post(
        users_url,
        params: {
          user: {
            name: 'stuart',
            email: 'stuart.43@example.net',
            password: 'isasecret',
            password_confirmation: 'isasecret'
          }
        }
      )
      assert_response :redirect
    end
    assert_redirected_to user_url(User.last)
    follow_redirect!
    assert_select 'div.alert.alert-success', match: /successfully.*created/i
    assert_equal User.last.id, session[:user_id]
  end
  test 'it does not sign up a user passing invalid data' do
    assert_no_difference 'User.count' do
      post(
        users_url,
        params: {
          user: {
            name: 'stuart',
            email: 'stuart.43.net',
            password: 'isast',
            password_confirmation: 'isasecret'
          }
        }
      )
    end
    assert_select 'div.alert.alert-danger', match: /errors.*user/i
    assert_select 'div.field_with_errors'
  end
end
