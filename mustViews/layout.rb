class App
	module Views
		class Layout < Mustache
			include AppHelper
			def admin
				logged_in?
				true
			end
		end
	end
end
#