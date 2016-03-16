class ListsController < ApplicationController

  def new
    @list = List.new
  end
  
  def create
    @user = User.find(params[:user_id])
    @list = @user.lists.build(list_params)
    @list.save
    @user = @list.user

    redirect_to @user
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    
    redirect_to root_path
  end
  
  def show
    @list = List.find(params[:id])
    @items = @list.items
  end

  private

  def list_params
    params.require(:list).permit(:user, :title)
  end

end