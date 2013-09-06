require 'spec_helper'
require './server'

describe Video do
	before :each do
		@video = Video.new
	end

	before :all do

	end
	it "should return a Video" do
		@book.should be_an_instance_of Video
	end
	it "successfully creates project" do
		visit root_path
		click_link "Project"
		fill_in "Name", with: "Foo"
		fill_in "Description", with: "Bar"
		click_button "Create Project"
		page.should have_content "Project was successfully created."
	end
end