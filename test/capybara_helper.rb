# class CapybaraTestCase < MiniTest::Test
#   include Capybara::DSL

#   # def setup
#   # 	Capybara.app = Sinatra::Application.new
#   # end
#   # def teardown
#   #   Capybara.reset_sessions!
#   #   Capybara.use_default_driver
#   # end
# end
ENV['RACK_ENV'] = 'test'

require 'rubygems'
require 'capybara'

require_relative '../server.rb'
# Capybara.app = App