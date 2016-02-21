require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  setup do
    @item = items(:one)
    @item2 = items(:two)
    @user = users(:user)
    @user.items << @item
    @user2 = users(:user2)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_template :index
    assert_not_nil assigns(:items)
  end

  test "should get new" do
    log_in_as @user
    get :new
    assert_response :success
  end

  test "should not get new when not logged in" do
    get :new
    assert_redirected_to(root_url + "login")
  end

  test "should create item" do
    log_in_as @user
    assert_difference('Item.count') do
      post :create, item: { content: @item.content, location: @item.location, name: @item.name, price: @item.price, rent: @item.rent, unit: @item.unit }
    end

    assert_redirected_to item_path(assigns(:item))
  end

  test "should not create item when not logged in" do
    assert_no_difference('Item.count') do
      post :create, item: { content: @item.content, location: @item.location, name: @item.name, price: @item.price, rent: @item.rent, unit: @item.unit }
    end

    assert_redirected_to(root_url + "login")
  end

  test "should show item" do
    get :show, id: @item
    assert_response :success
  end

  test "should get edit" do
    log_in_as @user
    get :edit, id: @item
    assert_response :success
  end

  test "should redirect edit when not owning user" do
    get :edit, id: @item
    assert_redirected_to(root_url + "login")
    log_in_as @user2
    get :edit, id: @item
    assert_redirected_to root_url
  end

  test "should update item" do
    log_in_as(@user)
    name = "new name"
    patch :update, id: @item, item: { name: name }
    assert_redirected_to @item
    @item.reload
    assert_equal name, @item.name
  end

  test "should not update item when not owning user" do
    name = "new name"
    patch :update, id: @item2, item: { name: name }
    assert_redirected_to(root_url + "login")
    @item2.reload
    assert_not_equal name, @item2.name
  end

  test "should destroy item" do
    log_in_as @user
    assert_difference 'Item.count', -1 do
      delete :destroy, id: @item
    end
    assert_redirected_to root_url
  end

  test "should not destroy when not admin" do

    assert_no_difference 'Item.count' do
      delete :destroy, id: @item
    end
    assert_redirected_to root_url + "login"

    log_in_as @user2
    assert_no_difference 'Item.count' do
      delete :destroy, id: @item
    end
    assert_redirected_to root_url
  end
end
