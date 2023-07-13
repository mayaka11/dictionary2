class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    #@post_images = @user.post_images  #特定のユーザー(@user)に関連付けられた投稿全て(.post_images)を取得し@post_imagesに渡すという処理を行うことができる。
                                      #結果的に、全体の投稿ではなく、個人が投稿した全てを表示できます。
    @post_images = @user.post_images.page(params[:page]) #1ページ分の決められた数のデータだけを新しい順に取得するように変更。
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id]) #ユーザーの取得
    @user.update(user_params) #ユーザーのアップデート
    redirect_to user_path(current_user.id)
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
