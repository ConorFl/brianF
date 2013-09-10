class Contact
	include DataMapper::Resource
	property :id, Serial
	property :icon, String
	property :contact_info, String
end