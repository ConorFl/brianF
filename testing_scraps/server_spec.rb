# require_relative '../app.rb'
# require 'rack/test'


# set :environment, :test
# set :run, false
# set :raise_errors, true
# set :logging, false

# def app
# 	Sinatra::Application
# end

# RSpec.configure do |conf|
#   conf.include Rack::Test::Methods
# end

# describe "Brian Site" do
# 	include Rack::Test::Methods

# 	it "should respond to GET" do
# 		get '/'
# 		last_response.should be_ok
# ##
# 	end

# 	it "should load the about" do
# 		get '/about'
# 		last_response.should be_ok
# 	end
	
# end