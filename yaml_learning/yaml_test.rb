require 'yaml'
require '../lib/user.rb'

user = User.new('test')

File.write('./test.yaml', YAML.dump(user))

new_user = YAML.unsafe_load_file('./test.yaml')

p user
p new_user
