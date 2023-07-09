class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :post_images,dependent: :destroy  #UserモデルにPostImageモデルを関連付ける。Userモデルに対してPostImageモデルが1:Nになるように関連付ける
  #has_manyは直訳すると「たくさん持っている」なので、1:Nの「1」側に当たるモデルに、has_manyを記載する必要がある


  has_one_attached :profile_image #profile_imageという名でActiveStorageでプロフィール画像を保存できるように設定した。

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed  #画像サイズの変更。
  end

end
