class ApplicationController < ActionController::Base
    before_action :set_current_user 

    # ログインユーザー取得処理
    def set_current_user
        @current_user = User.find_by(id: session[:user_id])
    end

    # ログインせずに直接URLを叩いた場合の処理
    def authenticate_user
        if @current_user == nil
            flash[:notice] = "ログインが必要です"
            redirect_to("/login") 
        end
    end

    # ログインしている状態で直接URLを叩いた場合の処理
    def forbid_login_user
        if @current_user
          flash[:notice] = "すでにログインしています"
          redirect_to("/posts/index")
        end
      end
end
