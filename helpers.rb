helpers do
	#session helpers
	def login!
		session[:loggedIn] = true
	end

	def logout!
		session.clear
		redirect '/'
	end

	def logged_in?
		session[:loggedIn]
	end

	def authenticate!
		if(params['username'] == 'walterwhite' && params['password'] == 'heisenberg')
			login!
			redirect '/admin'
		else
			redirect '/login'
		end
	end
	#public route helpers
	def video_tags projs
		projs.collect { |proj| proj.tags.split(', ')}.flatten.uniq
	end

	def to_title route
		route[1,route.index('/edit')-1].capitalize
	end
	# Removes _method param that was added to form to make put/delete work.
	def params_fixer params
		puts "*"*50+" params is a #{params.class}"
		#where does :captures come from??
		fixed_params = params.select { |key, value| key != '_method' && key != 'splat' && key != 'captures' }
		fixed_params['img_url'] = Video.url_to_img_url(params[:url])
		puts "*"*50
		puts "fixed params is a #{fixed_params.class}"
		puts fixed_params.inspect
		fixed_params
	end
end