require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save category without name" do
    category = Category.new
    assert_not category.save
  end

  test "should not save category with invalid image" do
    category = Category.new(name: "Cars", avatar: File.open(Rails.root.join('public', 'robots.txt')))
    assert_not category.save
  end
end
