class ArticlesController < ApplicationController
  before_action :getArticle, only: [:show, :edit, :update, :destroy, :like]
  before_action :article_params, only: [:create, :update]
  def index
    @articles = Article.all
  end

  def show
    # @joined = Text.join(:image)
    @sortdata = (@article.texts + @article.images).sort_by &:order
  end

  def new
    @article = Article.new
  end

  def create
    # binding.pry

    @article = Article.new(article_params)
    return redirect_to articles_url, notice: 'Create sucessfully' if @article.save
    flash[:notice] = 'Error in form'
    render :new
  end

  def edit
    render :edit
  end

  def update
    return redirect_to articles_url, notice: 'Update sucessfully' if @article.update(article_params)
    flash[:notice] = 'Update fail'
    render :edit
  end

  def destroy
    return redirect_to articles_url, notice: 'Delete sucessfully' if @article.destroy
    flash[:notice] = 'Delete fail'
    redirect_to articles_url
  end

  def like
    like_component(@article, @article)
  end


  private
    def getArticle
      @article = Article.find(params[:id])
    end

    def article_params
      article_params = params.require(:article).permit(:title, :posttime, :like)
    end
end
