require_relative 'poll.rb'

class User
  def initialize(name)
    @name = name
    @polls = []
    @votes = {}
  end

  attr_reader :name
  attr_accessor :polls

  def create_poll(poll_name, options)
    Poll.new(poll_name, options, self)
  end

  def votes
    # How to make it so only admins can view votes?
  end
end

class Admin < User
  def show_user_votes(user)
    user.votes
  end
end
