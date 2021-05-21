class TopicsController < ApplicationController
  
  def index
    @topics=Topic.all
  end
  
  def myindex
    @mytopics=Topic.all(current_user)
  end
  
  def new
    @topic=Topic.new
  end
  
  def create
    @topic=current_user.topics.new(topic_params)
    if @topic.save
      redirect_to topics_path,success:"投稿しました"
    else
      flash.now[:danger]="投稿に失敗しました"
      render:new
    end
  end
  
  def show
    @topic=Topic.find_by(id: params[:id])
  end
  
 def edit
   @topic=Topic.find_by(id: params[:id])
 end
 
  def update
    @topic=Topic.find_by(id: params[:id])
    if @topic.update(topic_update_params)
      redirect_to topics_path,success:"更新しました"
    else 
      flash.now[:danger]="更新に失敗しました"
      render:new
    end
  end
  
  def destroy
    @topic=Topic.find_by(id: params[:id])
    @topic.delete
    redirect_to topics_path,info:"投稿を削除しました"
  end
      
  private
    
    def topic_params
      params.require(:topic).permit(:image,:description).merge(user_id: current_user.id)
    end
    
    def topic_update_params
      params.require(:topic).permit(:description)
    end
    

end
