class CommentsController < ApplicationController
  def create
    #@comment = Comment.new(comment_params)
    #@comment.user_id = current_user.id
    
    @micropost = Micropost.find(params[:micropost_id])
    #この上の行がすごい大事。params[:id]ではダメ。
    #/microposts/:micropost_id/comments =>comments#createなので。
  @comment = @micropost.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
       @micropost.create_notification_comment!(current_user, @comment.id)
      redirect_back(fallback_location: root_path)
      #redirect_to root_path
    else
      #redirect_back(fallback_location: root_path)
      redirect_to microposts_path
    end

    end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
