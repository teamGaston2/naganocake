class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @customer = @order.customer
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_status: params[:order][:order_status])
    @order_details = @order.order_details
    if params[:order][:order_status] == "payment_confirmation"
      @order_details.update(making_status: "waiting_production")
    end
    
  flash[:notice] = "注文ステータスを変更しました"
  redirect_to admin_order_path(@order)
  end

end