class LikesController < ApplicationController

  def create
    like = Like.new(like_params)
    if like.save
      redirect_back(fallback_location: root_path)
    else
      redirect_to
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
  end

  private

  def like_params
    params.require(:like).permit(:liker_id, :liker_type, :likeable_id, :likeable_type)
  end

end
