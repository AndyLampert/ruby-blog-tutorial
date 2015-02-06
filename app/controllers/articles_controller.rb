# A frequent practice is to place the standard CRUD actions in each
# controller in the following order: 
# index, show, new, edit, create, update, and destroy. 

class ArticlesController < ApplicationController
	def index
		@articles = Article.all
	end

	def show
		# .find finds the article we want
		# (params[:id]) gets the param :id from the request
		# @article (an instance var) is used to hold reference to article object
		@article = Article.find(params[:id])
	end

	def new
		# This is creating a new instance variable called @article
		@article = Article.new
	end

	# adds an edit action to the ArticlesController
	def edit 
		@artile = Article.find(params[:id])
	end

	def create
		# init model with respectivu attributes
		# params[:article] contains necessary attributes
		# Article is cap b/c it is a class (defined in \models\article.rb)

		@article = Article.new(article_params)

		# saves model in the db
		if @article.save
			# redirect user to the show action
			redirect_to @article
		else
			# render is done in the same request (redirect is another request)
			render 'new'
		end
	end

	# update method is used when you want to update a record that already exists
	# accepts a hash containing attributes that you want to update
	def update 
		@article = Article.find(params[:id])

		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end
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