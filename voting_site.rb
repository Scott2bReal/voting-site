# Gem dependencies
require 'sinatra'
require 'sinatra/reloader' if development?
require 'tilt/erubis'

# Custom class dependencies
require_relative 'lib/poll.rb'
require_relative 'lib/user.rb'

configure do
  enable :sessions
  set :session_secret, 'secret'
end

before do
  @polls = [Poll.new(1, 'New Poll')]
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
