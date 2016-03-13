class ItemsController < ApplicationController
  respond_to :html, :js

  def create
    @list = List.find(params[:list_id])
    @item = @list.items.build(item_params)
    
    respond_to do |format|
       format.html
       format.js
    end
    
    redirect_to :back
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