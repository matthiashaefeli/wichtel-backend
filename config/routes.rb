Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :fotos
  resources :blogs
  get '/fotos_home', to: 'fotos#home'
  get '/blog_home', to: 'blogs#home'
end
