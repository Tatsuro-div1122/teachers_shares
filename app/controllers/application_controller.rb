class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # before_action :authenticate_user!, unless: :home_controller?

  before_action :configure_permitted_parameters, if: :devise_controller?
  # devise利用の機能（ユーザ登録、ログイン認証など）が使われる場合、その前にconfigure_permitted_parametersを実行

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name, :last_name, :school_type, :prefecture, :school_name, :subject, :year, :user_status])
    # サインアップするときのストロングパロメーター

    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar, :family_name, :last_name, :school_type, :prefecture, :school_name, :subject, :year, :introduction])
    # アカウント編集するときのストロングパロメーター   avatarはactive_storageのカラム
  end

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :user
      new_user_session_path
    elsif resource_or_scope == :admin
      new_admin_session_path
    else
      root_path
    end
  end
end
