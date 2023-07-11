Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  get 'homes/about' => 'homes#about', as: 'about' #名前付きルート

  #get 'post_images/new'
  #get 'post_images/index'
  #get 'post_images/show'
  #上記3つをまとめて書いた形
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resources :post_comment, only: [:create] #コメントは投稿画面に対してコメントされます。このため、post_commentsはpost_imagesに結びつきます。このような親子関係を「ネストする」といいます。
  end


  #get 'users/show'
  #get 'users/edit'
  resources :users, only: [:show, :edit, :update] #上記2つをまとめて書いた形

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
