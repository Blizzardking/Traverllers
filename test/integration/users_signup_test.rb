require 'test_helper'
require 'table_print'
class UsersSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      tp User.all
      post_via_redirect users_path, user: { firstname:  "Renkai",
                                            lastname: "Ji",
                                            email: "renkaikevin.ji@example.com",
                                            password: "123456789",
                                            gender: "1",
                                            safe_question: "How are you?",
                                            date_of_birth: Date.new(1984, 1, 27),
                                            safe_answer: "Tianjin" }
    end
    assert_template 'users/show'
    assert is_logged_in?
  end
end
