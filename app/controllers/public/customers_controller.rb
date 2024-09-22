class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
    if @customer == current_customer
      render :edit
    else
      redirect_to customer_path(current_user)
    end
  end

  def update
    @customer = current_customer
      if @customer.update(customer_params)
        flash[:notice] = "変更を保存しました。"
        redirect_to my_page_path
      else
        render :edit
      end
  end

  def unsubscribe
    @customer = current_customer
  end

  def withdraw
    @customer = Customer.find(current_customer.id)
    @customer.update(is_active: false)
    reset_session
    flash[:notice] = "退会処理を実行しました"
    redirect_to root_path
  end

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana,
      :email, :postal_code, :address, :telephone_number)
  end


end
