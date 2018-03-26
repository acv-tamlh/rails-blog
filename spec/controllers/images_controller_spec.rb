require 'rails_helper'

RSpec.describe ImagesController, type: :controller do
  let!(:image) { create(:image) }
  def params(headline = 'good headline', order = '2', like = '2')
    image_params = {headline: headline, like: like}
  end
  describe 'create image' do
    def create_request(params)
      post :create, params: { image: FactoryBot.attributes_for(:text, params) }
    end
    it 'good params' do
      expect{ create_request(params) }.to change(Image, :count).by(1)
      expect(response).to redirect_to article_path(Image.last.article.id)
    end
    it 'bad params' do
      expect{ create_request(params('')) }.to change(Image, :count).by(0)
      expect(response).not_to redirect_to article_path(Image.last.article.id)
    end
  end
  describe 'read image' do
    end
    it 'good params' do
      get :show, params: { article_id: image.id, id: image.id }
      expect(assigns(:image)).to eq image
    end
    # it 'bad params' do
    #   get :show, params: { article_id: 'not_found', id: image.id }
    #   # expect(respone).to raise_error ()
    # end
  # describe 'update image' do
  #   it 'sucessfully' do
  #
  #   end
  #   it 'fail' do
  #
  #   end
  # end
  # describe 'delete imgage' do
  #   it 'sucessfully' do
  #
  #   end
  #   it 'fail' do
  #
  #   end
  # end
end
