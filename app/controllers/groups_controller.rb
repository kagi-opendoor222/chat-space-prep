class GroupsController < ApplicationController
  def index

  end
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
    @group = Group.find(params[:id])
    if @group.update(group_params)
      @group.users = User.where(id: params[:group][:user_ids])
      redirect_to root_path, notice: "グループ更新しました。"
    else
      render :new
    end
  end
  private
  def group_params
    params.require(:group).permit(:name)
  end
end
