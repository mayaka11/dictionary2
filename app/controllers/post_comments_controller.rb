class PostCommentsController < ApplicationController

  def create
    post_image = PostImage.find(params[:post_image_id])
    comment = current_user.post_comments.new(post_comment_params)
      #上記の一文は下記の2つの文を省略した記述をしています。
      #comment = PostComment.new(post_comment_params)
      #comment.user_id = current_user.id
    comment.post_image_id = post_image.id
    comment.save
    redirect_to post_image_path(post_image)
  end

  private


  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
