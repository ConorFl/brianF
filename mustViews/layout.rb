class App < Sinatra::Base
	module Views
		class Layout < Mustache
			def admin
				@session[:loggedIn]
			end			
		end
	end
end
#