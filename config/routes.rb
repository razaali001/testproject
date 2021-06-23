Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "businesses#index"

  resources :users
  resources :businesses do
    member do
      get :add_member
      post :create_member
      delete :destroy_member
    end
  end



end
