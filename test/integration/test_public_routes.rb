ENV['RACK_ENV'] = 'test'

require 'capybara_helper'
require 'rubygems'
require 'capybara'

class TestPublicRoutes < MiniTest::Test
	include Capybara::DSL

	def setup
		Capybara.app = Sinatra::Application.new
	end
	def test_fail
		# flunk "Write tests!"
		assert true
		# assert @good_saved_article.save
	end
	def test_homepage
		visit '/'
		assert page.has_content?("Conor")
	end
end