class Users::MessagesController < ApplicationController
  def index
    @title = "メッセージボックス"
    @user = User.find(params[:user_id])
    if @user == current_user
      @users = User.where(deleted_at: nil, prefecture: current_user.prefecture)
                   .where.not(id: current_user.id)
                   .order("RANDOM()").limit(5)
    end
    send_ids = current_user.messages.where(receiver_id: @user.id).pluck(:id)
    receive_ids = @user.messages.where(receiver_id: current_user.id).pluck(:id)
    @messages = Message.where(id: send_ids + receive_ids).includes(:user).order(created_at: :desc)
    @message = Message.new
    #@receiver = User.find_by(id: @message.receiver_id)
  end

  def create
    @user = User.find(params[:user_id])
    @message = current_user.messages.build(message_params)
    @message.receiver_id = @user.id
    if @message.save
      flash[:notice] = 'メッセージを送信しました。'
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = 'メッセージを送信できませんでした。'
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    flash[:alert] = 'メッセージを削除しました。'
    redirect_back(fallback_location: root_path)
  end


  private

  def message_params
    params.require(:message).permit(:content)
  end
end
