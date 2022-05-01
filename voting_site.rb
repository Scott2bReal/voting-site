# Gem dependencies
require 'bcrypt'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'tilt/erubis'
require 'require_all'
require 'yaml'

# Custom class dependencies
require_all 'lib'

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
  users = []
  user_files = Dir.glob("#{user_path}/*")
  user_files.each do |user_file|
    users << YAML.unsafe_load_file(user_file)
  end

  users
end

def create_new_user(username, password)
  user = User.new(username, create_bcrypt_password(password))
  save_user(user)
end

def create_bcrypt_password(password)
  BCrypt::Password.create(password)
end

def save_user(user)
  File.write("#{user_path}/#{user.name}.yaml", YAML.dump(user))
end

def error_for_new_user_form(username, password, verify_password)
  if @users.any? { |user| user.name == username }
    "The username #{username} is already in use."
  elsif password != verify_password
    "Passwords do not match"
  end
end

def valid_login?(username, password)
  if !@users.any? { |user| user.name == username }
    return false
  else
  end

  true
end

configure do
  enable :sessions
  set :session_secret, 'secret'
end

before do
  @root = File.expand_path('..', __FILE__)
  # @polls = load_poll_data
  @users = load_user_data
  @polls = [Poll.new('Test poll', [PollOption.new, PollOption.new], User.new('Test User'), votes_private: true)] 
end

# Display homepage
get '/' do
  redirect '/polls'
end

# Display list of polls
get '/polls' do
  erb :polls
end

# Display specific poll
get '/polls/:pollid' do
  @poll = @polls.find { |poll| poll.id == params[:pollid].to_i }

  erb :poll
end

# View create new user page
get '/users/create' do
  erb :create_user
end

# Create new user
post '/users/create' do
  username = params[:new_username]
  password = params[:new_password]
  verify_password = params[:verify_password]

  error = error_for_new_user_form(username, password, verify_password)

  if error
    session[:error] = error
    status 422
    erb :create_user
  else
    create_new_user(username, password)
    session[:success] = "Account '#{username}' created"
    redirect '/users/login'
  end
end

# View Log in page
get '/users/login' do
  erb :log_in
end
