Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'articles#index'
  resources :articles do
    resource :texts
    member do
      get 'like', to: :likeArticle, controller: 'articles'
    end
  end
  resources :texts do
    member do
      get 'like'
    end
  end
  resources :images do
    member do
      get 'like'
    end
  end
end
