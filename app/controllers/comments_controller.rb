class CommentsController < ApplicationController
  def new
    @comment=Comment.new
  end
  
  def create
    @topic=Topic.find_by(id: params[:topic_id])
    @comment=Comment.new(comment_params)
    @comment.user_id=current_user.id
    @comment.topic_id=params[:topic_id]
    if @comment.save
      redirect_to topics_path,success:"#{@topic.user.name}さんの投稿にコメントしました"
    else
      render:new
    end
  end
end
