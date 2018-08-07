class GroupsController < ApplicationController
  def new
    @group = Group.new
  end
  def create
    @group = Group.new(create_params)
    if @group.save
      @group.users << User.where(id: params[:group][:user_ids])
      flash[:notice] = "グループ作成しました。"
      redirect_to root_path
    else
      render :new
    end
  end
  def show

  end
  def edit

  end
  def update

  end
  private
  def create_params
    params.require(:group).permit(:name)
  end
end
