require 'rails_helper'

RSpec.describe TextsController, type: :controller do
  describe 'create text' do
    def do_request (title = 'title', sentence = 'sentence')
        post :create, params: { text: FactoryBot.attributes_for(:text, title: title, sentence: sentence) }
    end
    it 'create sucessfully' do
      get :new
      expect{ do_request }.to change(Text, :count).by(1)
      expect(response).to redirect_to article_path(Text.last.article_id)
    end
    it 'create fail' do
      get :new
      expect { do_request('') }
      expect(response).to render_template :new
    end
  end
  describe 'read text' do
    # let!(:text) { create(:text) }
    # it 'show text' do
    #   get :show, params: {article_id: text.last.article_id, format: text.id}
    #   expect(response).to render_template
    # end
  end
  describe 'update text' do
    let!(:text) { create(:text) }
    def params(headline = 'good headline')
      text_params = {headline: headline}
    end
    it 'good params' do
      patch :update, params: {article_id: text.article_id, id: text.id, text: params}
      text.reload
      expect(assigns(:text).headline).to eq text.headline
    end
    it 'bad params' do
      patch :update, params: {article_id: text.article.id, id: text.id, text: params('')}
      text.reload
      expect(assigns(:text).headline).not_to eq text.headline
    end
  end
  describe 'delete text' do

  end

end
