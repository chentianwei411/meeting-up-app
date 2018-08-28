Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :users
    end
  end

  resources :meetings do
    resources :comments
  end

  devise_for :users

  root 'meetings#index'
end
