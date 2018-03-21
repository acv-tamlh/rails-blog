require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe 'GET #index' do
    it "render template" do
      get :index
      expect(response).to render_template :index
    end
    it "show all article" do
      articles = create_list(:article, 5)
      get :index
      expect(assigns(:articles)).to eq articles
    end
  end
  describe 'GET #show' do
    let(:article) { create(:article) }
    it 'render template' do
      get :show, params: {id: article.id}
      expect(response).to render_template :show
    end
    it 'get assign article id' do
      get :show, params: {id: article.id}
      expect(assigns(:article).id).to eq article.id
    end
  end
  describe 'GET #edit' do
    let(:article) { create(:article) }
    it 'render template' do
      get :edit, params: {id: article.id}
      expect(response).to render_template :edit
    end
    it 'get assigns article id' do
      get :edit, params: {id: article.id}
      expect(assigns(:article).id).to eq article.id
    end
  end
end