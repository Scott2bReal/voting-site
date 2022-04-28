require_relative 'user.rb'

class Poll
  def initialize(name, options=[], creator)
    @id = set_id
    @name = name
    @options = options # array of PollOptions
    @creator = creator # User object
  end

  attr_reader :id, :name, :creator
  attr_accessor :options

  private

  def set_id
    # TODO
    1
  end
end

class Vote
  def initialize(voter)
    @voter = voter # will be an object of the User class
  end
end
