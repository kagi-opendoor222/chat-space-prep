class GroupsController < ApplicationController
  def new
    @group = Group.new
  end
  def create
    @group = Group.new(group_params)
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
    @group = Group.find(params[:id])
  end
  def update
  end
  private
  def group_params
    params.require(:group).permit(:name)
  end
end
