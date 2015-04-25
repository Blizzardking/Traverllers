class CommentsController < ApplicationController
  def new
    @micropost = Micropost.find(params[:micropost_id])
    @comment = @micropost.comments.build
    respond_to do |format|
      format.js
    end
  end

  def create
    @micropost = Micropost.find(params[:micropost_id])
    @comment = @micropost.comments.create(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      respond_to do |format|
        format.html { redirect_to current_user }
        format.js
      end
    else
      flash.now[:danger] = "comment saved error!"
      respond_to do |format|
        format.html { redirect_to current_user }
        format.js
      end
    end
  end
  
  def destroy 
  end
  private

   def comment_params
        params.require(:comment).permit(:user_id, :micropost_id, :body)
   end
end
