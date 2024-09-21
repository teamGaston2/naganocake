class Public::OrdersController < ApplicationController
  def new
    @order = Order.new(payment_method: 0)
  end

  def thanks
  end

  def index
    @order = Order.all
    @order_detail = OrderDetail.all
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
    @order = Order.new
    @ad = Address.new(ad_params)
    @cart_items = current_customer.cart_items.all
    # @payment_method_jp = I18n.t("activerecord.attributes.order.payment_method.#{payment_method}")
    if params[:order][:address_selection] == "0" # 自宅の場合
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
      @payment_method = params[:order][:payment_method]
    elsif params[:order][:address_selection] == "1" # 既存の配送先の場合
      @address_list = Address.find(params[:order][:address_id])
      @order.postal_code = @address_list.postal_code
      @order.address = @address_list.address
      @order.name = @address_list.name
      @payment_method = params[:order][:payment_method]
    elsif params[:order][:address_selection] == "2" # 新しいお届け先
      @ad.postal_code = params[:order][:postal_code]
      @ad.address = params[:order][:address]
      @ad.name = params[:order][:name]
      @payment_method = params[:order][:payment_method]
    else
      flash[:notice] = "不正な住所選択が行われました"
      redirect_to new_order_path and return
    end
  end

  def create
    @order = Order.new(order_details_params)
    if @order.save
      render :thanks
    else
      flash[:error] = @order.errors.full_messages.join(", ") + "注文が失敗しました。"
      render :new
    end
  end

  private
  def order_details_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :order_status)
  end

  def ad_params
    params.require(:order).permit(:postal_code, :address, :name)
  end
end
