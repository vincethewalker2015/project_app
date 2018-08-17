class CommentsController < ApplicationController
  before_action :require_user
  
  def create
    @project = Project.find(params[:project_id])
    @comment = @project.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      ActionCable.server.broadcast "comments", render(partial: 'comments/comment', object: @comment)
      #flash[:success] = "Comment sucessfully created"
      #redirect_to project_path(@project)
    else
      flash[:danger] = "Unsucessfull! Try again.."
      redirect_to :back
    end
  end
  
  
  private
  
  def comment_params
    params.require(:comment).permit(:description)
  end
  
end