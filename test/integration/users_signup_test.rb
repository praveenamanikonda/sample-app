require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "invalid signup information" do
    get '/signup'
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name: "",
                                         email: "",
                                         password: "",
                                         password_confirmation: ""
                                       } }
    end 
    assert_template 'users/new'
  end 
  
  test "valid signup information" do
    get '/signup'
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name: "Example User",
                                         email: "user@example.com",
                                         password: "password",
                                         password_confirmation: "password"
                                        }  }
    end 
    follow_redirect!
    assert_template 'users/show'
  end
end
