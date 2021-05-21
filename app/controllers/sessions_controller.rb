class SessionsController < ApplicationController
  def new
  end
  
  def create
   user=User.find_by(email: params[:email])
   if user && user.authenticate(params[:password])
     login user
     redirect_to root_path,success:"ログインしました"
   else
     flash.now[:danger]="ログインに失敗しました"
     render:new
   end
  end
  
  def destroy 
    logout
    redirect_to root_path,info:"ログアウトしました"
  end
  
  private 
  def login(user)
    session[:user_id]=user.id
  end
  
  def logout
    current_user.delete
    session[:user_id]=nil
  end
    
  
end
