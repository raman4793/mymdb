class RelationshipsController < ApplicationController

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

end
