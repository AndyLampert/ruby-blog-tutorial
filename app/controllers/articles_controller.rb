class ArticlesController < ApplicationController
	def new
	end
	def create
		# added to see what params look like
		render plain: params[:article].inspect
	end
end

# In this example: 
# http://www.example.com/?username=dhh&email=dhh@email.com
# params[:username] is "dhh"
# params[:email] is "dhh@email.com"