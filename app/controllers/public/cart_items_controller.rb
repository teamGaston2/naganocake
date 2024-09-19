class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
    @total_payment = 0
  end

  def create
      if CartItem.find_by(item_id: params[:cart_item][:item_id]).present?
        @cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id])
        cart_item.amount += params[:cart_item][:amount].to_i
        cart_item.save
        redirect_to cart_items_path
      else
        @cart_item = Cart_item.new(cart_item_params)
        cart_item.customer_id = current_customer.id
        cart_item.item_id = cart_item_params[:item_id]
        cart_item.save
        redirect_to cart_items_path
      end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = Cart_item.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    CartItem.destroy_all
    redirect_to cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
