class PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
  end

  def create  #投稿データの保存
    @post_image = PostImage.new(post_image_params) #投稿するデータをPostImageモデルに日モズクデータとして保存する準備。フォームに入力されたデータが@post_imageに格納されることになっている
    @post_image.user_id = current_user.id #「@post_image.user_id」、つまりこの当行のuser_idとしてcurrent_user.idの値を代入するという意味になる。
                                          #「current_user」は、コードを記述するだけで、ログイン中のユーザー情報を取得できる便利な記述。deviseをインストールしていたら使用可能
    @post_image.save
    redirect_to post_images_path
  end

  def index
    @post_images = PostImage.all
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new #コメントを投稿するためのインスタンス変数を定義する。
  end

  def destroy
    post_image = PostImage.find(params[:id])  #データを1件取得
    post_image.destroy   #データを削除
    redirect_to post_images_path
  end


  private  #投稿データのストロングパラメータ

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end

end
