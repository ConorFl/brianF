class App < Sinatra::Base
	module Views
		class AdminEditArticle < Layout

			def title
				@article.title
			end

			def lowercase_title
				@article.title.downcase
			end

			def instructions
				@article.instructions
			end

			def content
				@article.content
			end
		end
	end
end