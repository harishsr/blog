class ArticlesController < ApplicationController

  # ISNECUD

  def index
    @article = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.create(article_params)
    if @article.save
      flash[:success] = "Your entry was created."
      render 'show'
    else
      redirect_to 'new'
    end
  end

  def update
  end

  def destroy
  end

  private

    def article_params
      params.require(:article).permit(:title, :entry)
    end
end
