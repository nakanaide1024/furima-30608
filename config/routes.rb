Rails.application.routes.draw do
  devise_for :users

  root to: "products#index"
  resources :products, except: [ :index] do
    resources :buyers, only: [ :index, :create]
  end
end