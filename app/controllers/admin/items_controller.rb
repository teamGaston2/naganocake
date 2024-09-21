class Admin::ItemsController < ApplicationController
   before_action :set_genres, only: [:new, :create]
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
      redirect_to admin_items_path, notice: 'Item was successfully created.'
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

  def update
    @item = Item.find(params[:id])
    @item.update!(item_params)
    redirect_to admin_item_path(@item)
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :is_active, :image, :genre_id)

  end

  def set_genres
    @genres = Genre.all
  end

end
