# require_relative 'poll.rb'
require 'yaml'

class User
  @@ids_in_use = []

  def initialize(name, password_hash, admin: false)
    @id = set_id
    @name = name
    @polls = []
    @votes = {}
    @admin = admin
    @password_hash = password_hash
  end

  attr_reader :id, :name, :password_hash
  attr_accessor :polls

  def ==(other_user)
    self.id == other_user.id
  end

  # def create_poll(poll_name, options)
  #   Poll.new(poll_name, options, self)
  #   log a poll in self's history
  # end

  def admin?
    @admin
  end

  def toggle_admin
    @admin = !self.admin?
  end

  # def to_yaml
  #   hash = {
  #     id: @id,
  #     name: @name,
  #     polls: @polls,
  #     votes: @votes,
  #     admin: @admin
  #   }

  #   hash.to_yaml
  # end

  private

  def set_id
    # May be solved by using a database...
    id = @@ids_in_use.empty? ? 0 : (@@ids_in_use.max + 1)
    @@ids_in_use << id
    id
  end
end
