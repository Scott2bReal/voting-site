require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative '../lib/user.rb'

class UserTest < Minitest::Test
  def setup
    @test_user = User.new("Test")
    @test_admin = User.new("Test Admin", admin: true)
  end

  def test_users_have_names
    assert_equal "Test", @test_user.name
    assert_equal "Test Admin", @test_admin.name
  end

  def test_admins_are_admins
    assert_equal true, @test_admin.admin?
  end

  def test_regular_users_are_not_admin
    assert_equal false, @test_user.admin?
  end

  def test_admin_toggle_works
    assert_equal false, @test_user.admin?

    @test_user.toggle_admin

    assert_equal true, @test_user.admin?
  end
end
