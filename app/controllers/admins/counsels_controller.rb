class Admins::CounselsController < ApplicationController
  def index
    @counsels = Counsel.all
    @title = "悩み相談"
  end

  def show
    @counsel = Counsel.find(params[:id])
  end

  def destroy
    counsel = Counsel.find(params[:id])
    counsel.destroy
    redirect_to admins_counsels_path, alert: "悩み相談を削除しました"
  end

  def category_counsels
    if params[:category]
      @title = "#{params[:category]} の悩み相談"
      @counsels = Counsel.where(category: params[:category]).includes(:user).order("created_at DESC")
    end
    render 'index'
  end
end
