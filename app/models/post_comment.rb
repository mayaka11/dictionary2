class PostComment < ApplicationRecord

  belongs_to :user #UserモデルとPostCommentモデルの関連付け。
  belongs_to :post_image  #PostImageモデルとPostCommentモデルの関連付け。
end
