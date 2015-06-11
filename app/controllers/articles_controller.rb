class ArticlesController < ApplicationController

  def index
    @articles = Article.all.order("created_at DESC")
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.create(article_params)
    if @article.save
      flash[:success] = "Your entry was created."
      redirect_to @article
    else
      redirect_to new_article_path
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(article_params)
      flash[:success] = "Your entry was updated."
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy    
  end

  private

    def article_params
      params.require(:article).permit(:title, :entry)
    end
end
