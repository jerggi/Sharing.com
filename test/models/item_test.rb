require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save category without name" do
    item = Item.new(price: 2.2, location: 'Brno')
    assert_not item.save
  end

  test "should not save category without location" do
    item = Item.new(name: "Miesacka", price: 2.2)
    assert_not item.save
  end

  test "should not save category with invalid price" do
    item1 = Item.new(name: "Miesacka", price: '2,2', location: 'Brno')
    assert_not item1.save
    item2 = Item.new(name: "Miesacka", price: '-2.2', location: 'Brno')
    assert_not item2.save
    item3 = Item.new(name: "Miesacka", price: 'dva.2', location: 'Brno')
    assert_not item3.save
    item4 = Item.new(name: "Miesacka", price: '2.2.2', location: 'Brno')
    assert_not item4.save
    item5 = Item.new(name: "Miesacka", location: 'Brno')
    assert_not item5.save
  end

  test "should not save item with invalid image" do
    item = Item.new(name: "Miesacka", avatar: File.open(Rails.root.join('public', 'robots.txt')))
    assert_not item.save
  end
end
