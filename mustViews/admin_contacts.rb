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

			def icons
				icons = []
				icon_files = Dir.entries('public/img/contact_icons') - [".",".."]
				icon_files.each do |icon|
					icons.push({i_file: icon, i_name: icon[/(^\w+)(\-)/,1] })
				end
				icons
			end
		end
	end
end
