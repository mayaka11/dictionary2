class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]


  def show
    @user = User.find(params[:id])
    #@post_images = @user.post_images  #特定のユーザー(@user)に関連付けられた投稿全て(.post_images)を取得し@post_imagesに渡すという処理を行うことができる。
                                      #結果的に、全体の投稿ではなく、個人が投稿した全てを表示できます。
    @post_images = @user.post_images.page(params[:page]) #1ページ分の決められた数のデータだけを新しい順に取得するように変更。
  end

  def edit
    #user = User.find(params[:id])  #下記3つの記述によりログインしているユーザー以外が編集ができなくなる。
    #unless user.id == current_user.id
      #redirect_to post_images_path
    #end

    #is_matching_login_user  #下記にメソッドとしてまとめたため、上記の[before_action]を使用することができるようになった

    @user = User.find(params[:id])
  end

  def update
    #user = User.find(params[:id])  #下記3つの記述によりログインしているユーザー以外がアップデートできなくなる
    #unless user.id == current_user.id
      #redirect_to post_images_path
    #end

    #is_matching_login_user   #下記にメソッドとしてまとめたため、上記の[before_action]を使用することができるようになった

    @user = User.find(params[:id]) #ユーザーの取得
    @user.update(user_params) #ユーザーのアップデート
    redirect_to user_path(current_user.id)
  end



  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

  def is_matching_login_user  #この記載により上記の同じコードを置き換えることができる。
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to post_images_path
    end
  end


end
