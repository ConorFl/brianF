source "https://rubygems.org"
ruby '1.9.3'
gem 'sinatra'
gem 'sinatra-namespace'
gem 'data_mapper'
gem 'rack'
gem 'mustache'

group :production do
	gem "pg"
	gem "dm-postgres-adapter"
end

group :development, :test do
	gem 'rack-test'
	gem 'capybara', :git => 'git://github.com/jnicklas/capybara.git'
	gem 'guard-test'
	gem 'guard-minitest'
	gem "sqlite3"
	gem "dm-sqlite-adapter"
	gem 'minitest'
	gem 'growl'
	gem 'turn'
	gem 'shotgun'
	# gem 'rspec'
	# gem 'ZenTest'
	# gem 'autotest-fsevent'
	# gem 'redgreen'
	# gem 'test-unit', '~> 2.0.0'
	# gem "spec-helper"
end
