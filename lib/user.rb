class User
  def initialize(name, admin: false)
    @name = name
    @polls = []
    @votes = {}
    @admin = admin
  end

  attr_reader :name
  attr_accessor :polls, :votes

  def create_poll(poll_name, options)
    Poll.new(poll_name, options, self)
  end

  def admin?
    @admin
  end
end
