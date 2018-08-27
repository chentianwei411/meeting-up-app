Rails.application.routes.draw do
  resources :meetings
  devise_for :users

  root 'meetings#index'
end
