require 'sinatra/base'
# require 'sinatra'
#TRY SINATRA/BAWSR
require 'sinatra/namespace'
require 'data_mapper'
#MUSTACHE ADD-ON
require 'mustache/sinatra'
require './models/init'
require  './main_helper'

class App < Sinatra::Base
	require './mustViews/layout'
	register Mustache::Sinatra
	register Sinatra::Namespace
	helpers Sinatra::MainHelper
	enable :sessions

	set :mustache, { views: './mustViews', templates: './mustTemplates'}

	DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/development.db")
	DataMapper.finalize.auto_upgrade!

	#HACK TO PASS SESSION TO MUSTACHE VIEWS
	before { @session = session	}

	#Public Routes
	get('/?') do
		@article = Article.first(title: "Welcome") 
		mustache :show 
		# erb :index
	end
	get '/projects' do 
		@projects = Video.all
		# erb :projects
		mustache :projects
	end
	['/about', '/resume'].each do |route|
		get route do 
			@article = Article.first(title: route[1,10].capitalize)
			# erb :show
			mustache :show
		end
	end
	get '/contacts' do
		@contacts = Contact.all
		# erb :contacts
		mustache :contacts
	end

	#Login Routes
	get('/login') 	{ logged_in? ? (mustache :admin_index) : (mustache :login) }
	post('/login') 	{ authenticate! }
	get('/logout') 	{ logout! }

	#/admin Routes/Namespace
	namespace '/admin' do
		before { redirect '/login' unless logged_in? }

		get('/?') { mustache :admin_index }
		['/welcome/edit', '/about/edit', '/resume/edit'].each do |route|
			get route do 
				@article = Article.first(title: to_title(route))
				mustache :admin_edit_article
				# erb :'/admin/editarticle'
			end
			post route do
				@article = Article.first(title: to_title(route)).update(content: params[:content])
				redirect '/admin'
			end
		end
		get '/contacts' do
			@contacts = Contact.all
			@icons = Dir.entries('public/img/contact_icons') - [".",".."]
			# erb :'admin/contacts'
			mustache :admin_contacts
		end
		get '/contacts/:type/new' do
			@params = params
			# erb :'admin/newcontact'
			mustache :admin_new_contact
		end
		post '/contacts/:icon_img/new' do
			new_contact = Contact.create(icon: params[:icon_img], contact_info: params[:contact])
			if new_contact.save
				redirect '/admin/contacts'
			else
				@error = "Contacts must have an link, email, etc."
				redirect back
			end
		end
		#SHOULD BE DELETE, BUT DELETE/PUT HACK STOPPED WORKING...
		post '/contacts/:id' do
			Contact.get(params[:id]).destroy
			redirect '/admin/contacts'
		end
		# /admin/projects Routes/Namespace
		namespace '/projects' do
			get '/?' do
				@projects = Video.all
				# erb :'admin/projects'
				mustache :admin_projects
			end
			get('/new') { mustache :admin_new }
			post '/new' do
				#NEED VALIDATATIONS ALSO WHERE DOES :capture COME FROM?
				Video.create(params_fixer(params))
				redirect '/projects'
			end
			get '/:id/edit' do
				@project = Video.get(params[:id])
				# erb :'admin/edit'
				mustache :admin_edit
			end
			#this was a put but it stopped working possibly while moving to mustache.
			post '/:id/edit' do
				Video.get(params[:id]).update(params_fixer(params))
				redirect '/admin/projects'
			end
			#should be delete, need to use post since put/delete hack is broken.
			post '/:id' do
				Video.get(params[:id]).destroy
				redirect '/admin/projects'
			end
		end
	end

	#404
	not_found do
		# puts "**"*30
		# puts "MESSAGE: #{@message}"
		"<h3>Maybe your best course would be to tread lightly.</h3>"
	end
end