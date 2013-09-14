		require './layout.rb'
class App < Sinatra::Base
	module Views
		include Layout
		class Projects < Layout
			def tags; @tags end
			
			def projects
				projects = []
				@projects.each do |proj|
					proj_hash = proj_to_hash(proj)
					projects.push proj_hash
				end
				projects
			end

			def proj_to_hash proj
				proj_hash = proj.attributes
				proj_hash[:tags_string] = proj_hash[:tags].gsub(", "," ")
				proj_hash[:tags] = proj_hash[:tags].split(', ')
				proj_hash
			end
		end
	end
end