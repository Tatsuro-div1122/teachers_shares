class Users::MessagesController < ApplicationController
  before_action :authenticate_user!
  def index
    @title = "メッセージボックス"
    @user = User.find(params[:user_id])

    # 知り合いかも？用の@users
    if @user == current_user
      @users = User.where(deleted_at: nil, prefecture: current_user.prefecture)
                   .where.not(id: current_user.id)
                   .sample(5)
    end
    @messages = Message.where(receiver_id: @user.id).page(params[:page]).reverse_order
    @message = Message.new
  end

  def create
    user = User.find(params[:user_id])
    message = Message.new(message_params)
    message.user_id = current_user.id
    message.receiver_id = user.id
    if message.save
      flash[:notice] = 'メッセージを送信しました。'
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = '空欄に入力してください。'
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    user = User.find(params[:user_id])
    if user.id = current_user.id
      @message = Message.find(params[:id])
      @message.destroy
    else
      redirect_to root_path, alert: "他の先生のアカウントページです。"
    end
  end

  def destroy_all
    user = User.find(params[:id])
    if user.id == current_user.id
      messages = Message.where(receiver_id: user.id)
      messages.destroy_all
    end
      flash[:alert] = "全てのメッセージを削除しました。"
      redirect_back(fallback_location: root_path)
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
