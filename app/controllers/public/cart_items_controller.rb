class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
    @total_payment = 0
  end

  def create
    @cart_item = Cart_item.new
    @cart_item.uer_id = current_user.id
    @cart_item.save
    render :index
  end
  
  def update
    @cart_item = Cart_item.find
    @cart_item.update
    render :index
  end

  def destroy
    @cart_item = Cart_item.find
    @cart_item.destroy
    render :index
  end
  
  def destroy_all
    @cart_item = Cart_item.find
    current_user.cart_items.destroy_all
  end
end
