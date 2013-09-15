require 'sinatra/base'

module Sinatra
	module MainHelper
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

		def to_title route
			route[1,route.index('/edit')-1].capitalize
		end
		
		# Removes _method param that was added to form to make put/delete work.
		def params_fixer params
			#where does :captures come from??
			fixed_params = params.select { |key, value| key != '_method' && key != 'splat' && key != 'captures' }
			fixed_params['img_url'] = Video.url_to_img_url(params[:url])
			fixed_params
		end
	end

	helpers MainHelper
end