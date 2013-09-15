require 'minitest_helper'
require 'rubygems'

class TestVideo < MiniTest::Test
	def setup
		@good_video = Video.create({"title" => "Machine", "url" => "http://www.youtube.com/watch?v=H30zTv406Mo", "tags" => "Rube, Goldberg"})
	end
	def teardown
		@good_video.destroy
	end
	def test_fail
		# flunk "Write tests!"
		assert true
	end
	def test_videos_with_bad_data_wont_save
		refute Video.create().save
	end
	def test_videos_with_good_data_will_save
		assert @good_video.save
	end
	def test_url_to_img_url_returns_nil_for_bad_urls
		assert_nil Video.url_to_img_url("www.google.com")
		assert_nil Video.url_to_img_url("foobar")
		assert_nil Video.url_to_img_url("youtube.com")
	end

	def test_url_to_img_url_returns_nil_for_good_urls
		assert_equal Video.url_to_img_url("http://www.youtube.com/watch?v=fVyVIsvQoaE"), "http://img.youtube.com/vi/fVyVIsvQoaE/0.jpg" 
	end
	#
end