class ArticlesController < ApplicationController
  before_action :getArticle, only: [:show, :edit, :update]
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
    return redirect_to articles_url, success: 'Update sucessfully' if @article.update(article_params)
    flash[:error] = 'Update fail'
    render :edit
  end


  private
    def getArticle
      @article = Article.find(params[:id])
    end

    def article_params
      article_params = params.require(:article).permit(:title, :posttime)
    end
end
