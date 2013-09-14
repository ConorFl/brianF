class App < Sinatra::Base
	module Views
		class AdminEdit < Layout
			def project
				@project.attributes
			end
		end
	end
end
