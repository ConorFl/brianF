class App
	module Views
		class Layout < Mustache
		# require_relative '../helpers.rb'
    		def admin
    			logged_in?
    			true
    		end
    	end
    end
end
