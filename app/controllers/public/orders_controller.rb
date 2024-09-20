class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def thanks
  end

  def index
    @order = Order.all
  end

  def show
    # @order = Order.find(params[:id]) データがない！！！！！
    @order = {
      order_id: 1,
      customer_id: 2,
      postal_code: "0000000",
      address: "Japan",
      name: "railsc",
      shipping_cost: 800,
      total_payment: 1800,
      payment_method: :credit_card,
      order_status: :making,
      created_at: Time.current,
      updated_at: Time.current,
    }

  end

  def confirm
    @order = current_customer.cart_items
    @ad = Address.new(order_details_params)
    @cart_items = current_customer.cart_items.all
    # @order = Order.find(params[:id])
    # @order_price = Order.all.sum(:price) 使えるかも
    # @order_details = @order.item
    @shipping = 800
    @total = 0
    # @payment_methods = params[:order][:payment_method]
    @payment_method_jp = I18n.t("activerecord.attributes.order.payment_method.#{@payment_method}")
    # @addressee = Address.find(params[:id])

    if params[:order][:address_selection] == "0" # 自宅の場合
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:address_selection] == "1" # 既存の配送先の場合
      @address_list = Address.find(params[:order][:address_id])
      @order.postal_code = @address_list.postal_code
      @order.address = @address_list.address
      @order.name = @address_list.name
    elsif params[:order][:address_selection] == "2" # 新しいお届け先
      @ad.postal_code = params[:order][:postal_code]
      @ad.address = params[:order][:address]
      @ad.name = params[:order][:name]
    else
      flash[:notice] = "不正な住所選択が行われました"
      redirect_to new_order_path and return
    end
  end

  private
  def order_details_params
    params.require(:order).permit(:item_id, :amount)
  end
end
