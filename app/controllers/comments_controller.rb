class CommentsController < ApplicationController

  def create
    comment = Comment.new(comment_params)
    if comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_to
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter_id, :commenter_type, :content, :commentable_id, :commentable_type)
  end

end
