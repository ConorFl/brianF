class App < Sinatra::Base
	enable :sessions
	module Views
		class Layout < Mustache
			def admin
				@session[:loggedIn]
			end
		end
	end
end
#