class RelationshipsController < ApplicationController
  
  before_action :set_user
  
  def create
   following=current_user.follow(@user)
   if following.save
    redirect_to @user,success:"フォローしました"
   else
    redirect_to @user,danger:"フォローに失敗しました"
   end
  end
  
  def destroy
    following=current_user.unfollow(@user)
     if following.destroy
       redirect_to @user,info:"フォロー解除しました"
     else
       redirect_to @user,danger:"フォロー解除に失敗しました"
     end
  end
   
   private
   　def
   　@user=User.find_by(params[:relationship][:follow_id])
   　end
   
   
end
