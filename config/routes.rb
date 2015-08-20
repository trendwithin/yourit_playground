Rails.application.routes.draw do
  root 'welcome#index'
  resource :post
  devise_for :users
end
