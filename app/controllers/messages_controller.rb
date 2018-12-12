class MessagesController < ApplicationController
  def index
    @message = Message.all
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(strong_params)
    if @message.save
      redirect_to root_path, notice: 'Success!'
    else
      flash[:alert] = 'Save error!'
      render :new
    end
  end

  def edit
    @message = Message.new(params[:id])
  end


  private

  def strong_params
    params.require(:message).permit(:title, :content)
  end
end
