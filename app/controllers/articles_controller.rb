class ArticlesController < ApplicationController
  before_action :getArticleParams, only: [:show, :edit]
  before_action :article_params, only: [:create, :update]
  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    return redirect_to articles_url, success: 'Create sucessfully' if @article.save
    flash[:error] = 'Error in form'
    render :new
  end

  def edit
    render :edit
  end

  def update
    return redirect_to articles_url, success: 'Update sucessfully' if @article.update(getArticleParams)
    flash[:error] = 'Update fail'
  end


  private
    def getArticleParams
      @article = Article.find(params[:id])
    end
end
