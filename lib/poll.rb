require_relative 'user.rb'
require 'date'

class Poll
  def initialize(name, creator, options=[], votes_private: false)
    @id = set_id
    @name = name
    @creator = creator # User object
    @options = options # array of PollOptions
    @date_created = Time.now
    @status = 'open'
    @votes_private = votes_private
  end

  attr_reader :id, :name, :creator, :status, :date_created
  attr_accessor :options

  def open?
    @status == 'open'
  end

  def close
    @status == 'closed'
  end

  def votes_private?
    @votes_private
  end

  def set_end_date
    # Users should be able to set an end date upon creation
    # Admins should be able to close polls early
  end

  def description
    "Authored by #{self.creator} on"
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
  # Not sure what exactly would be useful here
  # Starting out with simple 'yes' or 'no'
  def vote_yes
    @vote = 'yes'
  end

  def vote_no
    @vote = 'no'
  end
end

class Vote
  def initialize(voter)
    @voter = voter # will be an object of the User class
  end
end
