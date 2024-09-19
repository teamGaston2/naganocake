class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  private
  def get_image(width, height)
    params.require(:book).permit(:title, :body, :star)
  end
end
