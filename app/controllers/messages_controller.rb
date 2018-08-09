class MessagesController < ApplicationController
  before_action :set_group, only: [:index, :create]
  def index
    @message = Message.new
  end
  def create
    message = @group.messages.new(message_params.merge(user_id: current_user.id))
    if message.save
      redirect_to action: :index
    else
      redirect_to action: :index, alert: "メッセージ送信に失敗しました。"
    end
  end
  private
  def message_params
    params.require(:message).permit(:content, :image)
  end
  def set_group
    @group = Group.find(params[:group_id])
  end
end
