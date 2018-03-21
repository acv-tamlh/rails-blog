class TextsController < ApplicationController
  before_action :getText, only: [:show, :edit, :update, :destroy]
  before_action :text_params, only: [:create, :update]
  def index
    @texts = Text.all
  end

  def show
    @text.order(:order)
  end

  def new
    @text = Text.new
  end

  def create
    @text = Text.new(text_params)
    return redirect_to articles_url, success: 'Create sucessfully' if @text.save
    flash[:error] = 'Error in form'
    render :new
  end

  def edit

  end

  def update
    return redirect_to articles_url, success: 'Update sucessfully' if @text.update(text_params)
    flash[:error] = 'Update fail'
    render :edit
  end

  def destroy
    return redirect_to texts_url, success: 'Delete sucessfully' if @text.destroy
    flash[:error] = 'Delete fail'
    redirect_to texts_url
  end


  private
    def getText
      @text = Text.find(params[:id])
    end

    def text_params
      text_params = params.require(:text).permit(:headline, :order, :sentence, :article_id)
    end
end
