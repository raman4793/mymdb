class RelationshipsController < ApplicationController

  before_action :authenticate_user!

  def create
    type = params[:followable_type]
    id = params[:followable_id]
    @record = type.singularize.classify.constantize.find(id)
    authenticated_user.follow(@record)
  end

  def destroy
    type = params[:followable_type]
    id = params[:followable_id]
    @record = type.singularize.classify.constantize.find(id)
    authenticated_user.stop_following(@record)
  end

  def index

  end

  def block
    user = User.find(params[:id])
    current_user.block(user)
  end

  def unblock
    user = User.find(params[:id])
    current_user.unblock(user)
  end

end
