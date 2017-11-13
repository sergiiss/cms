class ArticlesController < ApplicationController
  def index
    @articles = Article.order(priority: :desc)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def edit
    find_article
  end

  def update
    find_article

    if @article.update_attributes(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def show
    find_article
  end

  def destroy
    find_article

    @article.destroy

    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).
      permit(
        :title,
        :description,
        :slug,
        :menu_label,
        :h1,
        :content,
        :published_at,
        :priority
      )
  end

  def find_article
    @article = Article.friendly.find(params[:id])
   end
end
