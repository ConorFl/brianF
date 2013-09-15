class App < Sinatra::Base
	module Views
		class AdminNewContact < Layout
			def error; @error end

			def icon_filename
				@params[:type]+"-48-black.png"
			end
		end
	end
end
