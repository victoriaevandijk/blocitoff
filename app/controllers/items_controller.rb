class ItemsController < ApplicationController
  respond_to :html, :js

  def new
    @list = List.find(params[:list_id])
    @item = @list.item.new
  end

  def create
    @list = List.find(params[:list_id])
    @item = @list.items.build(item_params)
    @item.save!
    
<<<<<<< HEAD
    redirect_to @list
=======
    redirect_to :back
>>>>>>> calendar
  end
  
  def destroy
     @item = Item.find(params[:id])
     @item.destroy
     redirect_to :back
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end