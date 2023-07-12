class PostImage < ApplicationRecord

  has_one_attached :image


  belongs_to :user  #has_manyとは逆に、1:Nの「N」側に当たるモデルに、belongs_toを記載する必要がある。
  #belongs_toとは直訳すると「～に属する」という意味。


  has_many :post_comments, dependent: :destroy #PostImageモデルにPostCommentモデルとの関連付け。 PostImageモデル 1:N PostCommentモデル。


  has_many :favorites, dependent: :destroy


  #下記は画像が投稿されていない場合にエラーが出るため、回避するための記述
  #def get_image
   # if image.attached?
    #  image
    #else
      #'no_image.jpg'
    #end
  #end

  #画像が存在しない場合に表示する画像をActiveStorageに格納するための記述。
  #今回は画像のサイズ変更をRailsで行うので、上記の記述を修正して記述します。
  def get_image  #画像が設定されない場合はapp/assets/imagesに格納されているno_image.jpgという画像をデフォルト画像としてActiveStageに格納し、格納した画像を表示するということが記載されている。
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      image
  end

  def favorited_by?(user) #このメソッドで引数で渡されたユーザーidがFavoritesテーブル内に存在(exists?)するかどうかを調べます。存在していればtrue,存在していなければfalseを返すようにしています。
    favorites.exists?(user_id: user.id)
  end
end
