class Users::RelationshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  def create
    follow = current_user.active_relationships.build(follower_id: params[:user_id])
    follow.save
  end

  def destroy
    follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
    follow.destroy
  end

  private
  def set_user
    @user = User.find(params[:user_id])
    if @user.deleted_at != nil
      redirect_to root_path, alert: "すでに退会された先生です"
    end
  end

end


