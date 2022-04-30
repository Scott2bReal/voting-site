# require_relative 'poll.rb'
require 'yaml'

class User
  @@ids_in_use = []

  def initialize(name, admin: false)
    @id = set_id
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

  def admin?
    @admin
  end

  def make_admin
    @admin = true
  end

  def to_yaml
    hash = {
      id: @id,
      name: @name,
      polls: @polls,
      votes: @votes,
      admin: @admin
    }

    hash.to_yaml
  end

  def see_votes(other_user)
    # How to make it so only admins can view votes?
    if self.admin?
    else
    end
  end

  private

  def set_id
    # May be solved by using a database...
    @@ids_in_use.empty? ? @@ids_in_use << 0 : @@ids_in_use << (@@ids_in_use.max + 1)
  end
end
