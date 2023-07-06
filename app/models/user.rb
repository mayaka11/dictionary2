class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :post_images,dependent: :destroy  #UserモデルにPostImageモデルを関連付ける。Userモデルに対してPostImageモデルが1:Nになるように関連付ける
  #has_manyは直訳すると「たくさん持っている」なので、1:Nの「1」側に当たるモデルに、has_manyを記載する必要がある
end
