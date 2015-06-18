class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    respond_to do |format| 
      if @comment.save
        format.html { redirect_to @article, notice: "Your response was saved." }
        format.js {}
        format.json { render @article.comments, notice: "Your response was saved." }
      else
        format.html { redirect_to @article, alert: "Your response was not saved.  Please try again." }
        format.js {}
        format.json { render @article.comments, alert: "Your response was not saved.  Please try again."}
      end
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:name, :body)
    end
end
