class Favorite < ApplicationRecord

  belongs_to :user  #UserモデルのidとFavoriteモデルのカラム(user_idとpost_image_id)と関連付け。
  belongs_to :post_image  #PostImageモデルのidとFavoriteモデルのカラム(user_idとpost_image_id)との関連付け。
end
