require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative '../lib/user.rb'

class UserTest < Minitest::Test
  def setup
    @test_user = User.new("Test")
    @test_admin = Admin.new("Test Admin")
  end

  def test_users_have_names
    assert_equal "Test", @test_user.name
    assert_equal "Test Admin", @test_admin.name
  end
end
