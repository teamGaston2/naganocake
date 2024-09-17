class Public::CustomersController < ApplicationController
  def index
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
  end

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana,
      :email, :post_code, :address, :telephone_number)
  end


end
