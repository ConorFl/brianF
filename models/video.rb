class Video
	include DataMapper::Resource
	property :id,		Serial
	property :title,	String, :required => true
	property :url,		String, :required => true
	property :img_url, String
	property :description, Text
	property :tags, 	String

	def initialize args
		self.title = args["title"]
		self.url = args["url"]
		self.description = args["description"]
		self.tags = args["tags"]
		self.img_url = Video.url_to_img_url(self.url)
	end

	def self.url_to_img_url url
		"http://img.youtube.com/vi/"+url[/(watch\?v=)(.{11})/,2]+"/0.jpg" rescue nil
	end
end