require 'minitest_helper'
require 'rubygems'

class TestVideo < MiniTest::Test
	def setup
		@good_data = {title: "Machine", url: "http://www.youtube.com/watch?v=H30zTv406Mo", tags: "Rube, Goldberg"}
	end
	def test_fail
		# flunk "Write tests!"
		assert true
	end
	def test_videos_with_bad_data_wont_save
		refute Video.create().save
	end
	def test_videos_with_good_data_wont_save
		assert Video.create(@good_data).save
	end
	def test_url_to_img_url_returns_nil_for_bad_urls
		refute Video.url_to_img_url("www.google.com")
		refute Video.url_to_img_url("foobar")
		refute Video.url_to_img_url("youtube.com")
	end

	def test_url_to_img_url_returns_nil_for_good_urls
		assert Video.url_to_img_url("http://www.youtube.com/watch?v=fVyVIsvQoaE")
	end
	#
end