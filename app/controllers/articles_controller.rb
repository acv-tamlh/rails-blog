class ArticlesController < ApplicationController
  before_action :getArticle, only: [:show, :edit, :update, :destroy, :like]
  before_action :article_params, only: [:create, :update]
  def index
    # byebug
    @articles = Article.all.published
  end

  def show
    # @joined = Text.join(:image)
    # byebug
    @sortdata = (@article.texts + @article.images).sort_by &:order
    authorize! :read, @sortdata

  end

  def new
    @article = Article.new
  end

  def create
    # binding.pry

    @article = Article.new(article_params)
    return redirect_to articles_url, notice: 'Create sucessfully' if @article.save
    flash[:alert] = 'Error in form'
    render :new
  end

  def edit
    render :edit
  end

  def update
    return redirect_to article_url(@article.id), notice: 'Update sucessfully' if @article.update(article_params)
    flash[:alert] = 'Update fail'
    render :edit
  end

  def destroy
    return redirect_to articles_url, notice: 'Delete sucessfully' if @article.destroy
    flash[:alert] = 'Delete fail'
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
