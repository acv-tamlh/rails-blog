class ArticlesController < ApplicationController
  before_action :getImage, only: [:show, :edit, :update, :destroy]
  before_action :text_params, only: [:create, :update]


  def show

  end

  private
    def getText
      @text = Text.find(params[:id])
    end

    def text_params
      text_params = params.require(:text).permit(:headline, :order, :sentence, :article_id)
    end
end
