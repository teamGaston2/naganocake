class Public::CustomersController < ApplicationController
  # def show
  #   @customer = Customer.find(params[:id])
  # end
  
  # def edit
  #   @customer = Customer.find(params[:id])
  #   if @customer == current_user
  #     render :edit
  #   else
  #     redirect_to customer_path(current_user)
  #   end
  # end
  
  # def update
  #   @customer = Customer.find(params[:id])
  #     if @customer.update(customer_params)
  #       flash[:notice] = "変更を保存しました。"
  #       redirect_to customer_path
  #     else
  #       render :edit
  #     end
  # end

  # def unsubscribe
  # end
  
  # def customer_params
  #   params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana,
  #     :email, :post_code, :address, :telephone_number)
  # end
  

end
