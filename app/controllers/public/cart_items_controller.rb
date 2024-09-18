class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items.all
    @total_payment = 0
  end

  def create
    cart_item = Cart_item.new(cart_item_params)
    cart_item.customer_id = current_customer.id
    cart_item.item_id = cart_item_params[:item_id]
      if CartItem.find_by(item_id: params[:cart_item][:item_id]).present?
        cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id])
        cart_item.amount += params[:cart_item][:amount].to_i
        cart_item.update(amount: cart_item.amount)
        render :index
      else
        cart_item.save
        render :index
      end
  end

  def update
    @cart_item = Cart_item.find(params[:id])
    @cart_item.update
    render :index
  end

  def destroy
    @cart_item = Cart_item.find(params[:id])
    @cart_item.destroy
    render :index
  end

  def destroy_all
    @cart_item = Cart_item.find(params[:id])
    current_user.cart_items.destroy_all
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
