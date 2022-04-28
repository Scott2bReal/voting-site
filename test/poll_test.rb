require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative '../lib/poll.rb'

class PollTest < Minitest::Test
  def setup
    @test_user = User.new("Test")
  end

  def test_users_can_create_new_poll
    poll = @test_user.create_poll('test_poll', ['option1', 'option2'])

    assert_equal true, poll.is_a?(Poll)
    assert_equal 'test_poll', poll.name
    assert_equal ['option1', 'option2'], poll.options
  end

  def test_poll_owner_is_set_to_creator_of_poll
    poll = @test_user.create_poll('test_poll', ['option1', 'option2'])

    assert_equal @test_user, poll.creator
  end
end
