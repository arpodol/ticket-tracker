class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  def index
    @tickets = Ticket.all
  end

  def show;end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    #@ticket.creator = current_user TODO!

    if @ticket.save
      flash[:notice] = "Your ticket was created."
      redirect_to tickets_path
    else
      render :new
    end
  end

  def edit;end

  def update
    if @ticket.update(ticket_params)
      flash[:notice] = "This ticket was updated."
      redirect_to ticket_path(@ticket)
    else
      render :edit
    end
  end

  def destroy
    @ticket.destroy
    flash[:notice] = "The ticket was successfully deleted."
    redirect_to tickets_url
  end

  private

  def ticket_params
    params.require(:ticket).permit(:name, :body, :project_id, :status, tag_ids: [])
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end
end
