source "https://rubygems.org"
ruby '2.0.0'
gem 'sinatra', '1.1.0'
gem 'sinatra-namespace'
gem 'data_mapper'
gem 'rack'

group :production do
	gem "pg"
	gem "dm-postgres-adapter"
end

group :development, :test do
	gem 'rack-test'
	gem 'capybara', :git => 'git://github.com/jnicklas/capybara.git'
	# gem 'rspec'
	gem 'guard-test'
	gem 'guard-minitest'
	gem "sqlite3"
	gem "dm-sqlite-adapter"
	# gem 'ZenTest'
	gem 'minitest'
	gem 'growl'
	gem 'turn'
	# gem 'autotest-fsevent'
	# gem 'redgreen'
	# gem 'test-unit', '~> 2.0.0'
	# gem "spec-helper"
end
