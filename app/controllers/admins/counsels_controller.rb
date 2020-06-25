class Admins::CounselsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @counsels = Counsel.all.page(params[:page]).reverse_order
    @title = "悩み相談"
  end

  def show
    @counsel = Counsel.find(params[:id])
    @counsel_comments = @counsel.counsel_comments
  end

  def destroy
    counsel = Counsel.find(params[:id])
    counsel.destroy
    redirect_to admins_counsels_path, alert: "悩み相談を削除しました"
  end

  def category_counsels
    if params[:category]
      @title = "#{params[:category]} の悩み相談"
      @counsels = Counsel.where(category: params[:category]).includes(:user).page(params[:page]).reverse_order
    end
    render 'index'
  end
end
