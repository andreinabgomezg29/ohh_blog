Rails.application.routes.draw do

  devise_for :users
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
        get :new_answer
        post :create_answer
      end
    end
  end

  resources :users
  resources :visits
end
