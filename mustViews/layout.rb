class App < Sinatra::Base
	enable :sessions
	module Views
		class Layout < Mustache
			def admin
				puts "SESSION: #{@session.inspect}"
				@session[:loggedIn]
			end
		end
	end
end
#