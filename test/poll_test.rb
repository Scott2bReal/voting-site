require 'minitest/autorun'
require 'minitest/reporters'
require 'date'
Minitest::Reporters.use!

require_relative '../lib/poll.rb'

class PollTest < Minitest::Test
  def setup
    @test_user = User.new("Test", 'test')
  end

  def test_poll_owner_is_set_to_creator_of_poll
    poll = Poll.new('test poll', @test_user)

    assert_equal @test_user, poll.creator
  end

  def test_poll_saves_creation_date
    # poll = @test_user.create_poll('test', [])
    poll = Poll.new('test poll', @test_user)

    assert_equal Date.today, poll.date_created.to_date
  end
end
