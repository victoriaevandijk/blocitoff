class ItemsController < ApplicationController
  respond_to :html, :js

  def create
    @user = User.find(params[:user_id])
    @item = current_user.items.create(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end