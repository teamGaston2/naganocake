class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @customer = @order.customer
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
       flash[:notice] = "注文ステータスを変更しました"
       redirect_to admin_order_path(@order)
    else
       flash[:notice] = "注文ステータス変更が失敗しました"
       redirect_to admin_order_path(@order)
    end
  end
  
private

  def order_params
    params.require(:order).permit(:order_status)
  end
  
end
