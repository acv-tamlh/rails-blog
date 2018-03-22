class ArticlesController < ApplicationController
  before_action :getArticle, only: [:show, :edit, :update, :destroy, :like]
  before_action :article_params, only: [:create, :update]
  def index
    @articles = Article.all
  end

  def show
    # @joined = Text.join(:image)
    # @sortdata = (@article.texts + @article.images).sort_by &:no
  end

  def new
    @article = Article.new
  end

  def create
    # binding.pry

    @article = Article.new(article_params)
    return redirect_to articles_url, success: 'Create sucessfully' if @article.save
    flash[:error] = 'Error in form'
    render :new
  end

  def edit
    render :edit
  end

  def update
    return redirect_to articles_url, success: 'Update sucessfully' if @article.update(article_params)
    flash[:error] = 'Update fail'
    render :edit
  end

  def destroy
    return redirect_to articles_url, success: 'Delete sucessfully' if @article.destroy
    flash[:error] = 'Delete fail'
    redirect_to articles_url
  end

  def like
    like_component(@article, @article, 'like sucessfully','like error' )
  end


  private
    def getArticle
      @article = Article.find(params[:id])
    end

    def article_params
      article_params = params.require(:article).permit(:title, :posttime, :like)
    end
end
