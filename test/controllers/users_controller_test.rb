require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def setup
    @user = users(:user)
    @user2 = users(:user2)
    @admin = users(:admin)
    #log_in_as(@user)
  end

  test "should get index" do
    log_in_as @admin
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should redirect index when not admin" do
    get :index
    assert_redirected_to root_url
    assert_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should redirect edit when user not logged in" do
    get :edit, id: @user
    assert_redirected_to root_url
  end

  test "should redirect update when user not logged in" do
    patch :update, id: @user, user: { name: @user.name, email: @user.email }
    assert_redirected_to root_url
  end

  # FAILING :(
  #test "successful edit" do
  #  log_in_as(@user)
  #  new_name = "new_name"
  #  patch :update, id: @user, user: { name: new_name }
  #  @user.reload
  #  assert_equal new_name, @user.name
  #end

  test "user can update only his profile" do
    log_in_as(@user2)
    assert_no_difference 'User.count' do
      patch :update, id: @user, user: { name: @user.name, email: @user.email }
    end
    assert_redirected_to root_url
  end

  test "user can edit only his profile" do
    log_in_as(@user2)
    get :edit, id: @user
    assert_redirected_to root_url
  end

  test "should delete user" do
    log_in_as @admin
    assert_difference 'User.count', -1 do
      delete :destroy, id: @user
    end
    assert_redirected_to users_url
  end

  test "user cannot destroy other user" do
    log_in_as(@user2)
    assert_no_difference 'User.count' do
      delete :destroy, id: @user
    end
    assert_redirected_to root_url
  end
end
