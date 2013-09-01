require_relative '../server.rb'
require 'rack/test'

set :environment, :test

def app
	Sinatra::Application
end

describe "Brian Site" do
	include Rack::Test::Methods

	it "should load the homepage" do
		get '/'
		last_response.should be_ok
##
	end

	it "should load the about" do
		get '/about'
		last_response.should be_ok
	end
	
end