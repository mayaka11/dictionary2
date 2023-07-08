#ここで記入したことは作成しているアプリケーションすべてに影響する
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller? #devise利用の機能（ユーザ登録、ログイン認証など）が使われる前にconfigure_permitted_parametersメソッドが実行される


  def after_sign_in_path_for(resource)  #サインイン後の遷移先の設定をするメソッド
    #about_path  #Deviseの初期設定ではroot_pathになっていますが、この記入によりAboutページへ遷移するように設定されました。
    post_images_path #この記述によりサインインごに投稿画像一覧が表示される
  end

  def after_sign_out_path_for(resource)  #サインアウト後の遷移先の設定をするメソッド
    about_path
  end



  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])  #configure_permitted_parametersメソッドでは、devise_parameter_sanitizer.permitメソッドを使うことでユーザ登録の際にユーザ名のデータ操作を許可しています
  end


end
