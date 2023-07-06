Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  get 'homes/about' => 'homes#about', as: 'about' #名前付きルート

  #get 'post_images/new'
  #get 'post_images/index'
  #get 'post_images/show'
  resources :post_images, only: [:new, :index, :show] #上記3つをまとめて書いた形
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
