class ArticlesController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @articles = Article.all.order("created_at DESC").paginate(page: params[:page], per_page: 2)
  end

  def user_index
    @articles = current_user.articles.all.order("created_at DESC").paginate(page: params[:page], per_page: 2)
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = current_user.articles.build
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      flash[:notice] = "Your entry was created."
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(article_params)
      flash[:notice] = "Your entry was updated."
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy 
    flash[:notice] = "Your entry was deleted."
    redirect_to root_url
  end

  private

    def article_params
      params.require(:article).permit(:title, :entry, :picture)
    end
end
