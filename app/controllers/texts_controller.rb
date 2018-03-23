class TextsController < ApplicationController
  before_action :authenticate_admin!

  before_action :getText, only: [:show, :edit, :update, :destroy, :like]
  before_action :text_params, only: [:create, :update]
  def index
    @texts = Text.all
  end

  def show
    # @text.order(:order)
  end

  def new
    @text = Text.new
  end

  def create
    @text = Text.new(text_params)
    return redirect_to article_url(@text.article.id), notice: 'Create sucessfully' if @text.save
    flash[:notice] = 'Error in form'
    render :new
  end

  def edit

  end

  def update
    return redirect_to article_url(@text.article.id), notice: 'Update sucessfully' if @text.update(text_params)
    flash[:notice] = 'Update fail'
    render :edit
  end

  def destroy
    return redirect_to article_url(@text.article.id), notice: 'Delete sucessfully' if @text.destroy
    flash[:notice] = 'Delete fail'
    redirect_to article_url(@text.article.id)
  end

  def like
    like_component(@text, @text.article)
  end

  private
    def getText
      @text = Text.find(params[:id])
    end

    def text_params
      @text_params = params.require(:text).permit(:headline, :order, :sentence, :article_id)
    end
end
