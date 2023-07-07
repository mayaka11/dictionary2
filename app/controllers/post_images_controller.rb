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
  end

  def show
  end


  private  #投稿データのストロングパラメータ

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end

end
