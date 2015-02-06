class CommentsController < ApplicationController
	def create
		#  Gets the article being commented on
		@article = Article.find(params[:article_id])
		# .create is used to make a save a comment
		@comment = @article.comments.create(comment_params)
		# after the comment, send the user back to the article
		redirect_to article_path(@article)
	end

	private
		def comment_params
			params.require(:comment).permit(:commenter, :body)
		end
end
