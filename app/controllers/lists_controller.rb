class ListsController < ApplicationController

  def new
    @list = List.new
  end
  
  def create
    @user = User.find(params[:user_id])
    @list = @user.lists.build(list_params)
    @list.save
    @user = @list.user

    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def show
    @list = List.find(params[:id])
    @items = @list.items
  end

  private

  def list_params
    params.require(:list).permit(:title)
  end

end