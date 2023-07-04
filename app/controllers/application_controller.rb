class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller? #devise利用の機能（ユーザ登録、ログイン認証など）が使われる前にconfigure_permitted_parametersメソッドが実行される

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])  #configure_permitted_parametersメソッドでは、devise_parameter_sanitizer.permitメソッドを使うことでユーザ登録の際にユーザ名のデータ操作を許可しています
  end


end
