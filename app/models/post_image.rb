class PostImage < ApplicationRecord

  has_one_attached :image

  belongs_to :user  #has_manyとは逆に、1:Nの「N」側に当たるモデルに、belongs_toを記載する必要がある。
  #belongs_toとは直訳すると「～に属する」という意味。
end
