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
  describe '#edit' do
    let!(:article) { create(:article) }
    def params(title = 'good title')
      article_params = { title: title }
    end
    it 'update with good params' do
      patch :update, params: {id: article.id, article: params}
      article.reload
      expect(assigns(:article).title).to eq article.title
    end
    it 'update with bad params' do
      patch :update, params: {id: article.id, article: params('')}
      expect(response).not_to eq article.title
    end
  end
  describe '#new article' do
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
    it 'sucessfully' do
      expect{ do_request }.to change(Article, :count).by(-1)
      expect(response).to redirect_to articles_path
    end
  end
  describe 'Like' do
    let!(:article) { create(:article) }
    it 'good params' do
      get :like, params: { id: article.id }
      expect(assigns(:article).like).to eq article.like + 1
      expect(response).to redirect_to article_path(article.id)
    end
  end
end
