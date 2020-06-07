class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?
  # devise利用の機能（ユーザ登録、ログイン認証など）が使われる場合、その前にconfigure_permitted_parametersを実行

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name, :last_name, :school_type, :prefecture, :school_name, :subject, :year])
    # サインアップするときのストロングパロメーター

    devise_parameter_sanitizer.permit(:account_update, keys: [:family_name, :last_name, :school_type, :prefecture, :school_name, :subject, :year, :introduction])
    # アカウント編集するときのストロングパロメーター
  end
end
