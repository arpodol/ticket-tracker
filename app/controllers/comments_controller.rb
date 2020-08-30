class CommentsController < ApplicationController
  before_action :set_ticket
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :require_same_user, only: [:edit, :update]


  def create
    @comment = @ticket.comments.new(comment_params.merge(creator: current_user))
    if @comment.save
      if params[:ticket_status].present?
        @ticket.update_attribute(:status, params[:ticket_status])
      end
      flash[:notice] = "Your comment was created."
      redirect_to ticket_path(@ticket)
    else
      render :edit
    end
  end

  def edit;end

  def update
    if @comment.update(comment_params)
      flash[:notice] = "This comment was updated."
      redirect_to ticket_path(@ticket)
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    flash[:notice] = "The comment was successfully deleted."
    redirect_to @ticket
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_ticket
    @ticket = Ticket.find(params[:ticket_id])
  end

  def set_comment
    @comment = @ticket.comments.find(params[:id])
  end

  def require_same_user
    if current_user != @comment.creator
      flash[:error] = "You're not allowed to do that!"
      redirect_to @ticket
    end
  end
end
