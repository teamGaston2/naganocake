class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
    @item_page = Item.page(params[:page]).per(10)
  end
  
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_items_path(@item)
    else
      render :new
    end
  end 
  
  def show
    @item = Item.find(params[:id])
  end
  
  def edit
    @item = Item.find(params[:id])
  end
  
  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :is_active, :image, :genre_id)
  end
end 
