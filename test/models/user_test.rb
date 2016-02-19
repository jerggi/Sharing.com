require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save user without name" do
    user = User.new(password: "K5gNufr585jdbf5Ipfr5484rfnKI544FINIFEfeFE54", email: 'user@sharin.com')
    assert_not user.save
  end

  test "should not save user with invalid password" do
    user1 = User.new(name: "User", password: "short", email: 'user@sharin.com')
    assert_not user1.save
    user2 = User.new(name: "User", email: 'user@sharin.com')
    assert_not user2.save
  end

  test "should not save user with invalid email" do
    user1 = User.new(name: "User", password: "qwertyuiop", email: '@sharin.com')
    assert_not user1.save
    user2 = User.new(name: "User", password: "qwertyuiop", email: 'user@sharin.')
    assert_not user2.save
    user3 = User.new(name: "User", password: "qwertyuiop", email: 'user@.com')
    assert_not user3.save
    user4 = User.new(name: "User", password: "qwertyuiop", email: 'usersharin.com')
    assert_not user4.save
    user5 = User.new(name: "User", password: "qwertyuiop", email: 'user@sharincom')
    assert_not user5.save
    user6 = User.new(name: "User", password: "qwertyuiop")
    assert_not user6.save
  end
end
