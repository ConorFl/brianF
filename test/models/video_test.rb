require_relative '../../server'
require 'rubygems'
gem 'test-unit'
require 'test/unit'
require 'test/unit/diff'

class VideoTest < Test::Unit::TestCase
	def test_fail
		flunk "Write tests!"
	end
	#
end