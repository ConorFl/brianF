ENV['RACK_ENV'] = 'test'

require 'capybara_helper'
require 'rubygems'
require 'capybara'

class TestPublicRoutes < MiniTest::Test
	include Capybara::DSL

	def setup
		Capybara.app = Sinatra::Application.new
	end
	def teardown
		Capybara.reset_sessions!
		Capybara.use_default_driver
	end
	def test_fail
		# flunk "Write tests!"
		# assert true
		# assert @good_saved_article.save
	end
	def test_homepage_renders
		visit '/'
		assert page.has_content?("Brian Flanagan")
	end
	def test_projects_page_renders_from_navbar
		visit '/'
		click_link "Projects"
		assert current_path == '/projects', "Current path should be '/projects, but #{current_path} was returned"
		assert find("h2").has_content? "Projects"
	end
	def test_admin_routes_redirect_to_login_when_signed_out
		visit '/admin'
		assert find("h2").has_content? "Login"
	end
	def test_navbar_changed_after_successful_login
		visit '/admin'
		fill_in 'username', with: 'walterwhite'
		fill_in 'password', with: 'heisenberg'
		click_on 'Login'
		assert find(".navbar").has_content? "Admin Dashboard"
	end
end