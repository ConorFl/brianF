class App < Sinatra::Base
	module Views
		class AdminContacts < Layout
			def contacts
				contacts = []
				@contacts.each do |proj|
					contact_hash = proj.attributes
					contacts.push contact_hash
				end
				contacts
			end
			puts "HEY EVEN I KNOW session= #{@session.inspect}"
			def proj_to_hash proj
				proj_hash = proj.attributes
				proj_hash[:small_img_url] = proj.img_url.gsub('/0.jpg','/1.jpg')
				proj_hash[:tags] = proj_hash[:tags].split(', ')
				proj_hash
			end

			def icons
				icons = []
				icon_files = Dir.entries('public/img/contact_icons') - [".",".."]
				puts "*"*50
				puts icon_files.inspect
				icon_files.each do |icon|
					icons.push({i_file: icon, i_name: icon[/(^\w+)(\-)/,1] })
				end
				icons
			end
		end
	end
end
