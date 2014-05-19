
class ExploreController < ApplicationController

	#layout 'admin'
	before_filter :authenticate_user!
	
 def index
		
	end

	def project
		redirect_to("http://localhost:3000/project")
	end

	def status
		redirect_to("http://localhost:3000/statuses")
	end

	def topics
		redirect_to("http://localhost:3000/topic/view")		
	end

	def info
		redirect_to("http://localhost:3000/users/info")
	end

	def home
		redirect_to("http://localhost:3000")
	end

end
