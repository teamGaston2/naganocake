class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
    @item_page = Item.page(params[:page]).per(10)
  end

  def new
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    
  end
end
