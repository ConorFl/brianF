class App < Sinatra::Base
	module Views
		class Show < Layout
			def title
				@article.title
			end

			def content
				@article.content
			end
		end
	end
end