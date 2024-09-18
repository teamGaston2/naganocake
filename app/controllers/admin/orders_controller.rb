class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @items = @order_details.map(&:item)
    @customer = @order.customer
  end

  def update
    @order = Order.find([:id])
    if @order.update(order_params)
       flash[:notice] = "注文ステータスを変更しました"
       redirect_to request.referrer
    else
       redirect_to request.referrer
    end
  end
  
private

  def order_params
    params.require(:order).permit(:order_status)
  end
  
end
