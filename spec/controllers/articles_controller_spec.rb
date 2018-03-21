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
end
