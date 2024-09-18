class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    # byebug
    # ↓仮データ↓
    sample = [
      { postal_number: '1234567', adress: '仮の住所1', addressee: '仮の名前1' },
      { postal_number: '7654321', adress: '仮の住所2', addressee: '仮の名前2' }
    ]

    # if params[:order][:address_selection] == "0" # 自宅の場合
    #   @order.postal_code = current_customer.postal_code
    #   @order.adress = current_customer.address
    #   @order.addressee = current_customer.first_name + current_customer.last_name
    # elsif params[:order][:address_selection] == "1" # 既存の配送先の場合
    #   @address_list = Address.find(params[:order][:address_id])
    #   @order.postal_code = @address.postal_code
    #   @order.adress = @address.address
    #   @order.addressee = @address.name
    # elsif params[:order][:address_selection] == "2" # 新しいお届け先
    #   @order.postal_code = params[:order][:new_postal_number]
    #   @order.adress = params[:order][:new_adress]
    #   @order.addressee = params[:order][:new_addressee]
    # else
    #   flash[:notice] = "不正な住所選択が行われました"
    #   redirect_to new_order_path and return
    # end
  end

  def thanks
  end

  def index
    # 仮のデータを直接作成
    @addresses = [
      Address.new(address_id: 1, customer_id: 1, post_number: '1234567', adress: '仮の住所1', addressee: '仮の名前1'),
      Address.new(address_id: 2, customer_id: 2, post_number: '7654321', adress: '仮の住所2', addressee: '仮の名前2')
    ]
  end

  def show
    # 仮のデータを作成して、単一のデータを表示
    @address = Address.new(address_id: params[:id], customer_id: 1, post_number: '1112222', adress: '仮の住所3', addressee: '仮の名前3')  end

  def confirm
    @order = Order.new(order_params)
    @order_details = OrderDetail.all
    @shipping = 800
    @total = 0
    @payment_methods = params[:order][:payment_method]
    @payment_method_jp = I18n.t("activerecord.attributes.order.payment_method.#{@payment_method}")
    # @addressee = Address.find(params[:id])
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
