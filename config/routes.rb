Rails.application.routes.draw do
  resources :boards
  devise_for :users
  root 'home#index'
 
  namespace :api do 
    resources :boards do 
      resources :lists, only: :index, controller: "lists"
    end
  end
end
