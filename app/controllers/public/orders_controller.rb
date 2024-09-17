class Public::OrdersController < ApplicationController
  def new
    @orders = Order.all
  end

  def thanks
  end

  def index
  end

  def show
  end

  def confirm
    @order = Order.new(order_params)
    # 下記条件分岐が必要
    # byebug
    # @address = Address.find(params[:order][:address_id])
    # @order.postal_code = @address.postal_code
    # @order.address = @address.address
    # @order.name = @address.name

    # @order.postal_code = current_customer.postal_code
    # @order.address = current_customer.address
    # @order.name = current_customer.first_name + current_customer.last_name
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end
end
