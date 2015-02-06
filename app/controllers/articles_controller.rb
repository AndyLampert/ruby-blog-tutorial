# A frequent practice is to place the standard CRUD actions in each
# controller in the following order: 
# index, show, new, edit, create, update, and destroy. 

class ArticlesController < ApplicationController
	def show
		# .find finds the article we want
		# (params[:id]) gets the param :id from the request
		# @article (an instance var) is used to hold reference to article object
		@article = Article.find(params[:id])
	end

	def new
	end

	def create
		# init model with respectivu attributes
		# params[:article] contains necessary attributes
		# Article is cap b/c it is a class (defined in \models\article.rb)

		@article = Article.new(article_params)

		# saves model in the db
		@article.save
		# redirect user to the show action
		redirect_to @article
		# added to see what params look like
		# render plain: params[:article].inspect
	end

	private 
		def article_params
			params.require(:article).permit(:title, :text)
		end
end

# In this example: 
# http://www.example.com/?username=dhh&email=dhh@email.com
# params[:username] is "dhh"
# params[:email] is "dhh@email.com"