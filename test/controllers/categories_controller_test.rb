require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  setup do
    @category = categories(:one)
    @admin = users(:admin)
    @user = users(:user)
  end
  # test "the truth" do
  #   assert true
  # end
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:categories)
  end

  test "successful update" do
    log_in_as(@admin)
    name = "Test name"
    patch :update, id: @category, category: { name: name }
    assert_not flash.empty?
    assert_redirected_to @category
    @category.reload
    assert_equal name, @category.name
  end

  test "unsuccessful update" do
    name = "Test name"
    patch :update, id: @category, category: { name: name }
    assert flash.empty?
    assert_redirected_to root_url
    @category.reload
    assert_not_equal name, @category.name
  end

  test "should redirect edit when not admin" do
    get :edit, id: @category
    assert_redirected_to root_url

    log_in_as @user
    get :edit, id: @category
    assert_redirected_to root_url
  end

  test "should get edit when admin" do
    log_in_as @admin
    get :edit, id: @category
    assert_response :success
  end

  test "should not destroy when not admin" do
    assert_no_difference 'Category.count' do
      delete :destroy, id: @category
    end
    assert_redirected_to root_url

    log_in_as @user
    assert_no_difference 'Category.count' do
      delete :destroy, id: @category
    end
    assert_redirected_to root_url
  end

  test "successful create" do
    log_in_as @admin
    assert_difference 'Category.count' do
      post :create, category: {name: "Cars"}
    end
    assert_redirected_to category_path(assigns(:category))
  end

  test "should not create when not admin" do
    assert_no_difference 'Category.count' do
      post :create, category: {name: "Cars"}
    end
    assert_redirected_to root_url
  end
end
