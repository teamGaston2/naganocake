class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    # byebug
    # ↓仮データ↓
    @sample = [
      { post_number: '1234567', adress: '仮の住所1', addressee: '仮の名前1' },
      { post_number: '7654321', adress: '仮の住所2', addressee: '仮の名前2' }
    ]

order = Order.create(order_id: "1", customer_id: "2", postal_code: "1000", address: "Japan", name: "rails c", shipping_cost: "800", total_payment: "1800", payment_method: :credit_card, order_status: :making, create_at: "Thu, 19 Sep 2024 03:04:26.251018397 JST +09:00", update_at: "Thu, 19 Sep 2024 03:04:26.251018397 JST +09:00")
order.save
order.errors.full_messages
Order.create(order_id: 1,customer_id: 2,postal_code: "0000000",address: "Japan",name: "railsc",shipping_cost: 800,total_payment: 1800,payment_method: :credit_card,order_status: :making,created_at: Time.now,updated_at: Time.now)
  end

  def thanks
  end

  def index
    @order = Order.all
  end

  def show
    # @order = Order.find(params[:id]) データがない！！！！！


  end

  def confirm
    @order = Order.new(order_params)
    # @order_price = Order.all.sum(:price) 使えるかも
    @order_details = OrderDetail.all
    @shipping = 800
    @total = 0
    # @payment_methods = params[:order][:payment_method]
    @payment_method_jp = I18n.t("activerecord.attributes.order.payment_method.#{@payment_method}")
    # @addressee = Address.find(params[:id])

    if params[:order][:address_selection] == "0" # 自宅の場合
      @order.postal_code = current_customer.postal_code
      @order.adress = current_customer.address
      @order.addressee = current_customer.first_name + current_customer.last_name
    elsif params[:order][:address_selection] == "1" # 既存の配送先の場合
      @address_list = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.adress = @address.address
      @order.addressee = @address.name
    elsif params[:order][:address_selection] == "2" # 新しいお届け先
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    else
      flash[:notice] = "不正な住所選択が行われました"
      redirect_to new_order_path and return
    end

  end

  private
  def order_params
    # params.require(:order).permit(:payment_method, :postal_code, :address, :name)
    # サンプルデータ
    {
    payment_method: 0,
    postal_code: '1234567',
    address: '仮の住所1',
    name: '仮の名前1'
    }
  end
end
