class Article
	include DataMapper::Resource
	property :id,		Serial
	property :title,	String, :required => true
	property :content, Text, :required => true
	property :instructions, Text
end