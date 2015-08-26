Rails.application.routes.draw do
  get 'related_posts/index'
  root 'welcome#index'
  get 'tags/:tag', to: 'posts#index', as: :tag
  resources :posts
  devise_for :users
end
