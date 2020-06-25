class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  # devise利用の機能（ユーザ登録、ログイン認証など）が使われる場合、その前にconfigure_permitted_parametersを実行

  before_action :request_path
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :school_type, :prefecture, :school_name, :subject, :year, :user_status])
    # サインアップするときのストロングパロメーター

    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar, :last_name, :first_name, :school_type, :prefecture, :school_name, :subject, :year, :introduction])
    # アカウント編集するときのストロングパロメーター   avatarはactive_storageのカラム
  end

  def request_path
    @path = controller_path + '#' + action_name
    def @path.is(*str)
        str.map{|s| self.include?(s)}.include?(true)
    end
end


end
