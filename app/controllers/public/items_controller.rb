class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @items = Item.all
    @genres = Genre.all
    # @genres = ['ケーキ', '焼き菓子', 'プリン', 'キャンディ']
  end

  private
  def get_image(width, height)
    params.require(:book).permit(:title, :body, :star)
  end
end
