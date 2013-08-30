source "https://rubygems.org"
gem 'sinatra', '1.1.0'
gem 'sinatra-namespace'
gem 'data_mapper'
group :production do
    gem "pg"
    gem "dm-postgres-adapter"
end

group :development, :test do
    gem "sqlite3"
    gem "dm-sqlite-adapter"
end