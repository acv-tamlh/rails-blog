require 'rails_helper'

RSpec.describe TextsController, type: :controller do
  let!(:text) { create(:text) }

  describe 'create text' do
    def do_request (title = 'title', sentence = 'sentence')
        post :create, params: { text: FactoryBot.attributes_for(:text, title: title, sentence: sentence) }
    end
    it 'good params' do
      get :new
      expect{ do_request }.to change(Text, :count).by(1)
      expect(response).to redirect_to article_path(Text.last.article_id)
    end
    it 'bad params' do
      get :new
      expect { do_request('') }
      expect(response).to render_template :new
    end
  end
  describe 'read text' do
    it 'sucessfully' do
      get :show, params: {article_id: text.article_id, id: text.id}
      expect(assigns(:text)).to eq text
    end
    # it 'fail' do
    #   get :show, params: {article_id: text.article_id, id: 'not_found_text_id'}
    #   expect(respone).to rails_exception(ActiveRecord::RecordNotFound)
    # end
  end
  describe 'update text' do
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
    def do_request(text_id = text.id)
      delete :destroy, params: {id: text_id}
    end
      it 'sucessfully' do
        expect{ do_request }.to change(Text, :count).by(-1)
        expect(response).to redirect_to article_path(text.article.id)
      end
      # it 'fail' do
      #   expect{ do_request('params not found') }.to change(Text, :count).by(0)
      # end
    end

end
