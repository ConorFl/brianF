class Contact
	include DataMapper::Resource
	property :id, Serial
	property :icon, String
	property :contact_info, String, :required => true, :length => 1..100
end