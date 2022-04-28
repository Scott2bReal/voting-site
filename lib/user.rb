require_relative 'poll.rb'

class User
  def initialize(name, admin: false)
    @name = name
    @polls = []
    @votes = {}
    @admin = admin
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
