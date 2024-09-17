class Public::AddressesController < ApplicationController



def index
  @address = Address.new
  @addresses = Address.all
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
  @address = Address.find(params[:id])
    if address.update(address_params)
      flash[:notice] = "変更を保存しました。"
      redirect_to address_path
    else
      render :edit
    end
end

  def address_params
    params.require(:address).permit(:addressee, :post_number, :address)
  end


end
