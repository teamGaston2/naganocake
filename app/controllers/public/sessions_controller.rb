# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :customer_state, only: [:create]

   def after_sign_in_path_for(resource)
     root_path
   end

   def after_sign_out_path_for(resource)
     root_path
   end



   private

    def customer_state
        customer = Customer.find_by(email: params[:customer][:email])
        if customer.nil?
          flash[:alert] = "アカウントが見つかりません。新規会員登録を行ってください。"
          redirect_to new_customer_registration_path and return
        end
        
        if customer.is_active == false
          flash[:alert] = "退会済みです。新規会員登録を行ってください"
          redirect_to new_customer_registration_path
        end

    end
    
    if customer.is_active == false
      flash[:alert] = "退会済みです。新規会員登録を行ってください。"
      redirect_to new_customer_registration_path
    end
end


  # def customer_params
  #   params.require(:customer).permit(:email)
  # end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
