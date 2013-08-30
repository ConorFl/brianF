require 'sinatra'
require 'sinatra/namespace'
require 'data_mapper'
enable :sessions

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/development.db")

class Article
	include DataMapper::Resource
	property :id,		Serial
	property :title,	String, :required => true
	property :content, Text, :required => true
	property :instructions, Text
end

class Video
	include DataMapper::Resource
	property :id,		Serial
	property :title,	String, :required => true
	property :url,		String, :required => true
	property :img_url, String
	property :description, Text
	property :tags, 	String
end
DataMapper.finalize.auto_upgrade!

get '/' do 
	erb :index
end

['/login', '/projects'].each do |route|
	get route do
		erb route.to_sym
	end
end

['/about', '/resume', '/contact'].each do |route|
	get route do 
		@article = Article.first(title: route[1,10].capitalize)
		erb :show
	end
end

post '/login' do
	puts params.inspect
	if(params['username'] == 'walterwhite' && params['password'] == 'heisenberg')
		session['loggedIn'] = true
		redirect '/admin'
	else
		redirect '/login'
	end
end

get '/logout' do
	session.clear
	redirect '/'
end

# get '/login' do
# 	erb :login
# end

# get '/projects' do
# 	erb :projects
# end

namespace '/admin' do
	before { redirect '/login' unless session['loggedIn']}
	['/welcome/edit', '/about/edit', '/resume/edit', '/contact/edit'].each do |route|
		get route do 
			@article = Article.first(title: route[1,route.index('/edit')-1].capitalize)
			erb :'/admin/editarticle'
		end
		post route do
			@article = Article.first(title: route[1,route.index('/edit')-1].capitalize)
			@article.update(content: params[:content])
			redirect '/admin'
		end
	end

	get '' do
		erb :'admin/index'
	end

#PUT ALL THIS IN A PROJECTS NAMESPACE
	get '/projects/:id/edit' do
		@project = Video.get(params[:id])
	end
	get '/projects' do
		@projects = Video.all
		erb :'admin/adminprojects'
	end
	get '/projects/new' do
		erb :'admin/new'
	end
	post '/projects/new' do
		Video.create(title: params[:title], url: params[:url], description: params[:description])
		redirect '/projects'
	end
end

	# get '/admin' do
	# 	erb :'admin/index'
	# end

# get '/admin/video/new' do
# 	erb :new
# end

# get '/admin/video/edit' do
# 	erb :edit
# end
# get '/otherstuff' do
# 	text = File.open("otherstuff.txt").gets
# 	text
# end
#admin routes

#404
not_found do
	"<h3>Maybe your best course would be to tread lightly.</h3>"
end