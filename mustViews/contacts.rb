class App < Sinatra::Base
	module Views
		class Contacts < Layout
			def contacts
				@contacts
			end
		end
	end
end