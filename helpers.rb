helpers do
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

	def url_to_img_url url
		"http://img.youtube.com/vi/"+url[/(watch\?v=)(.{11})/,2]+"/0.jpg"
	end

	def authenticate!
		if(params['username'] == 'walterwhite' && params['password'] == 'heisenberg')
			login!
			redirect '/admin'
		else
			redirect '/login'
		end
	end
	def to_title route
		route[1,route.index('/edit')-1].capitalize
	end
	# Removes _method param that was added to form to make put/delete work.
	def params_fixer params
		#where does :captures come from??
		fixed_params = params.select { |key, value| key != '_method' && key != 'splat' && key != 'captures' }
		fixed_params['img_url'] = url_to_img_url(params[:url])
		fixed_params
	end
end