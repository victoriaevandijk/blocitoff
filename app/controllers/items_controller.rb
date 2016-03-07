class ItemsController < ApplicationController
  respond_to :html, :js

  def create
    @user = User.find(params[:user_id])
    @item = current_user.items.create(item_params)
    redirect_to user_path
  end
  
  def destroy
     @user = User.find(params[:user_id])
     @item = Item.find(params[:id])
     @item.destroy
     redirect_to :back
	end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end