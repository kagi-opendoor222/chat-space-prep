class MessagesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @message = Message.new
  end
  def create
    group =  Group.find(5)
    message = group.messages.new(message_params.merge(user_id: current_user.id))
    if message.save
      redirect_to root_path
    else
      redirect_to root_path, alert: "メッセージ送信に失敗しました。"
    end
  end
  private
  def message_params
    params.require(:message).permit(:content, :image)
  end
end
