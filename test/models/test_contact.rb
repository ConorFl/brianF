require 'minitest_helper'
require 'rubygems'

class TestContact < MiniTest::Test
	def test_fail
		# flunk "Write tests!"
		assert true
	end

	def test_contact_wont_update_without_title_filled
		# refute @good_saved_article.update(title: nil)
	end
	def test_article_wont_update_without_content_filled
		# refute @good_saved_article.update(content: nil)
	end
	# def test_videos_with_bad_data_wont_save
	# 	refute Video.create().save
	# end
	# def test_videos_with_good_data_wont_save
	# 	assert Video.create(@good_data).save
	# end
	# def test_url_to_img_url_returns_nil_for_bad_urls
	# 	assert_nil Video.url_to_img_url("www.google.com")
	# 	assert_nil Video.url_to_img_url("foobar")
	# 	assert_nil Video.url_to_img_url("youtube.com")
	# end

	# def test_url_to_img_url_returns_nil_for_good_urls
	# 	assert_equal Video.url_to_img_url("http://www.youtube.com/watch?v=fVyVIsvQoaE"), "http://img.youtube.com/vi/fVyVIsvQoaE/0.jpg" 
	# end
	#
end