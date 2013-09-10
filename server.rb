require 'sinatra'
require 'sinatra/namespace'
require 'data_mapper'
require_relative 'helpers.rb'
require_relative 'models/init' 
enable :sessions

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/development.db")
DataMapper.finalize.auto_upgrade!

#Public Routes
get('/?') { erb :index }
get '/projects' do 
	@projects = Video.all
	@tags = video_tags(@projects)
	erb :projects
end
['/about', '/resume'].each do |route|
	get route do 
		@article = Article.first(title: route[1,10].capitalize)
		erb :show
	end
end
get '/contacts' do
	@my_contacts = Contact.all
	erb :contacts
end

#Login Routes
get('/login') { erb :login }
get('/logout') { logout! }
post('/login') { authenticate! }

#/admin Routes/Namespace
namespace '/admin' do
	before { redirect '/login' unless logged_in? }
	get('/?') { erb :'admin/index' }
	['/welcome/edit', '/about/edit', '/resume/edit'].each do |route|
		get route do 
			@article = Article.first(title: to_title(route))
			erb :'/admin/editarticle'
		end
		post route do
			@article = Article.first(title: to_title(route)).update(content: params[:content])
			redirect '/admin'
		end
	end
	get '/contacts' do
		@my_contacts = Contact.all
		@icons = Dir.entries('public/img/contact_icons') - [".",".."]
		erb :'admin/contacts'
	end
	get '/contacts/:type/new' do
		@type = params[:type]+"-48-black.png"
		erb :'admin/newcontact'
	end
	post '/contacts/:type/new' do
		Contact.create(icon: params[:type], contact_info: params[:contact])
		redirect '/admin/contacts'
	end
	delete '/contacts/:id' do
		Contact.get(params[:id]).destroy
		redirect '/admin/contacts'
	end
	# /admin/projects Routes/Namespace
	namespace '/projects' do
		get '/?' do
			@projects = Video.all
			erb :'admin/adminprojects'
		end
		get('/new') { erb :'admin/new' }
		post '/new' do
			#NEED VALIDATATIONS ALSO WHERE DOES :capture COME FROM?
			Video.create(params_fixer(params))
			redirect '/projects'
		end
		get '/:id/edit' do
			@project = Video.get(params[:id])
			erb :'admin/edit'
		end
		put '/:id/edit' do
			Video.get(params[:id]).update(params_fixer(params))
			redirect '/admin/projects'
		end
		delete '/:id' do
			Video.get(params[:id]).destroy
			redirect '/admin/projects'
		end
	end
end

#404
not_found do
	"<h3>Maybe your best course would be to tread lightly.</h3>"
end