class FavoritesController < ApplicationController
  def new
  end
  
  def create 
   favorite=Favorite.new
   favorite.user_id=current_user.id
   favorite.topic_id=params[:topic_id]
   if favorite.save
     redirect_to topics_path,success: "お気に入りに登録しました"
   else
     flash.now[:danger]="お気に入り登録に失敗しました"
   end
  end
  
  def destroy
    user=current_user
    favorite=Favorite.find_by(user_id: user.id, topic_id: params[:topic_id])
    favorite.delete
    redirect_to topics_path,info:"お気に入りを解除しました"
  end    
    
    
end
