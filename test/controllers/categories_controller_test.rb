require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  setup do
    @category = categories(:one)
    @user = users(:admin)
    log_in_as(@user)
  end
  # test "the truth" do
  #   assert true
  # end
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:categories)
  end

  test "successful edit" do
    #get edit_category_path(@category)
    get(:edit, {'id' => @category.id})
    name = "Test name"
    #patch(:update, id: @category, category: { name: name })
    #patch category_path(@category), category: { name: name }
    patch "/categories/" + @category.id.to_s, category: { name: name }
    assert_not flash.empty?
    #assert_redirected_to @category
    @category.reload
    assert_equal name, @user.name
  end
end
