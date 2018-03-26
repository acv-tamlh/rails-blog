require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe 'GET #index' do
    it "render template" do
      get :index
      expect(response).to render_template :index
    end
    let!(:articles2) { create_list(:article, 5, posttime: 69.day.from_now) }
    let!(:articles3) { create_list(:article, 2) }
    let!(:articles4) { create_list(:article, 2, posttime: Time.now - 1.day) }
    it "show all article published" do
      get :index
      expect(assigns(:articles).size).to eq articles3.size + articles4.size
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
  describe '#new article' do
    # let(:article) { create(:article) }
    def do_request(p = '123')
      post :create, params: { article: FactoryBot.attributes_for(:article, title: p) }
    end
    it 'render template' do
      get :new
      expect(response).to render_template :new
    end
    context 'create article' do
      it 'create sucessfully' do
        expect{ do_request }.to change(Article, :count).by(1)
      end
      it 'create fail' do
        expect{ do_request('') }.to change(Article, :count).by(0)
      end
    end
  end
  describe '#DELETE article' do
    let!(:article) { create(:article) }
    def do_request
      delete :destroy, params: { id: article.id }
    end
    it 'delete sucessfully' do
      expect{ do_request }.to change(Article, :count).by(-1)
      expect(response).to redirect_to articles_path
    end
  end
end
