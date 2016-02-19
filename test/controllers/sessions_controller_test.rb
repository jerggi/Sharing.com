require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @user = users(:user)
    user_id = @user.id
  end

  test "session should be empty when not logged in" do
    assert session.empty?
  end

  test "session shold not be empty when logged in" do
    log_in_as @user
    assert_not session.empty?
    assert_not_nil session[:user_id]
  end

  test "should should be empty when destroy" do
    log_in_as(@user)
    delete :destroy, id: @user
    assert_nil session[:user_id]
    assert_redirected_to root_url
  end

  #ako testovat?
  test "create ..." do

  end
end
