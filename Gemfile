source "https://rubygems.org"
ruby '2.0.0'
gem 'sinatra', '1.1.0'
gem 'sinatra-namespace'
gem 'data_mapper'
gem 'rspec'
gem 'rack'
gem 'rack-test'
gem 'ZenTest'
# gem 'autotest-growl'
# gem 'autotest-fsevent'

group :production do
	gem "pg"
	gem "dm-postgres-adapter"
end

group :development, :test do
	gem 'capybara', :git => 'git://github.com/jnicklas/capybara.git'
	# gem 'rspec'
	# gem 'guard-test'
	gem "sqlite3"
	gem "dm-sqlite-adapter"
	gem 'test-unit', '~> 2.0.0'
	# gem "spec-helper"
end
#