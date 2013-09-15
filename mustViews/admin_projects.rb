class App < Sinatra::Base
	module Views
		class AdminProjects < Layout
			def projects
				projects = []
				@projects.each do |proj|
					proj_hash = proj_to_hash(proj)
					projects.push proj_hash
				end
				projects
			end
			# puts "HEY EVEN I KNOW session= #{@session.inspect}"
			def proj_to_hash proj
				proj_hash = proj.attributes
				proj_hash[:small_img_url] = proj.img_url.gsub('/0.jpg','/1.jpg')
				proj_hash[:tags] = proj_hash[:tags].split(', ')
				proj_hash
			end
		end
	end
end
