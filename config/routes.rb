Rails.application.routes.draw do
  root 'welcome#index'
  resources :posts
  devise_for :users
end
