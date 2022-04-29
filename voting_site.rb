# Gem dependencies
require 'sinatra'
require 'sinatra/reloader' if development?
require 'tilt/erubis'

# Custom class dependencies
require_relative 'lib/poll.rb'
require_relative 'lib/user.rb'


def user_path
  if ENV['RACK_ENV'] == 'test'
    File.expand_path('../test/users', __FILE__)
  else
    File.expand_path('../users', __FILE__)
  end
end

def poll_path
  if ENV['RACK_ENV'] == 'test'
    File.expand_path('../test/polls', __FILE__)
  else
    File.expand_path('../polls', __FILE__)
  end
end

def load_poll_data
end

def load_user_data
end

configure do
  enable :sessions
  set :session_secret, 'secret'
end

before do
  @root = File.expand_path('..', __FILE__)
  # @polls = load_poll_data
  # @users = load_user_data
  @polls = [Poll.new('Test poll', [PollOption.new, PollOption.new], User.new('Test User'))]
end

# Display homepage
get '/' do
  redirect '/polls'
end

# Display list of polls
get '/polls' do
  # @polls << Poll.new(1, 'New Poll')
  erb :polls
end

# Display specific poll
get '/polls/:pollid' do
  @poll = @polls.find { |poll| poll.id == params[:pollid].to_i }

  erb :poll
end
