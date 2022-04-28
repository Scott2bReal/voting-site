require_relative 'user.rb'
require 'date'

class Poll
  def initialize(name, options=[], creator)
    @id = set_id
    @name = name
    @options = options # array of PollOptions
    @creator = creator # User object
    @date_created = Time.now
    @status = 'open'
  end

  attr_reader :id, :name, :creator, :status
  attr_accessor :options

  def open?
    @status == 'open'
  end

  def close
    @status == 'closed'
  end

  def set_end_date
    # Users should be able to set an end date
  end

  private

  def set_id
    # TODO
    # Need a good algorithm to set poll ids
    # May be solved by using a database...
    1
  end
end

class PollOption
end

class Vote
  def initialize(voter)
    @voter = voter # will be an object of the User class
  end
end
