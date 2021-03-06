class CommentsController < ApplicationController
	http_basic_authenticate_with name: "andy", password: "pass", only: :destroy

	def create
		#  Gets the article being commented on
		@article = Article.find(params[:article_id])
		# .create is used to make a save a comment
		@comment = @article.comments.create(comment_params)
		# after the comment, send the user back to the article
		redirect_to article_path(@article)
	end

	def destroy

		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:id])
		@comment.destroy
		redirect_to article_path(@article)
	end

	private
		def comment_params
			params.require(:comment).permit(:commenter, :body)
		end
end
