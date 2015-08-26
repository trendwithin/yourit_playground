Rails.application.routes.draw do
  root 'welcome#index'
  get 'tags/:tag', to: 'posts#index', as: :tag
  resources :posts
  devise_for :users
end
