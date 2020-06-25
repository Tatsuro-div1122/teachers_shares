class Users::CounselsController < ApplicationController
  before_action :authenticate_user!
  def index
    @title = "悩み相談"
    @counsels = Counsel.includes(:user).page(params[:page]).reverse_order
  end

  def new
    @counsel = Counsel.new
  end

  def create
    @counsel = Counsel.new(counsel_params)
    @counsel.user_id = current_user.id
    if @counsel.save
      redirect_to counsel_path(@counsel), notice: '先生の悩みが投稿されました'
    else
      flash.now[:alert] = "必須事項を記入してください"
      render 'new'
    end
  end

  def show
    @counsel = Counsel.find(params[:id])
    @user = @counsel.user
    @counsel_comment = CounselComment.new
    @counsel_comments = @counsel.counsel_comments.includes(:user).order("created_at DESC")
  end

  def edit
    @counsel = Counsel.find(params[:id])
  end

  def update
    @counsel = Counsel.find(params[:id])
    @counsel.user_id = current_user.id
    if @counsel.update(counsel_params)
      redirect_to counsel_path(@counsel), notice: "相談内容が更新されました"
    else
      flash.now[:alert] = "必須事項を記入してください"
      render 'edit'
    end
  end

  def destroy
    counsel = Counsel.find(params[:id])
    counsel.destroy
    redirect_to counsels_path
  end

  def category_counsels
    if params[:category]
      @title = "#{params[:category]} の悩み相談"
      @counsels = Counsel.where(category: params[:category]).includes(:user).page(params[:page]).reverse_order
    end
    render 'index'
  end

  private

  def counsel_params
    params.require(:counsel).permit(:title, :description, :category, :user_id)
  end
end
