Rails.application.routes.draw do

  root to: 'articles#public_index'

  resources :articles do
    collection do
      get :public_index
    end
    member do
      get :public_show
    end
    resources :comments do
      member do
        post :create_answer
      end
    end
  end

  resources :users
  resources :visits
end
