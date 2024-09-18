class Public::AddressesController < ApplicationController

def create
  @address = Address.new(address_params)
  @address.customer_id = current_customer.id
  if @address.save
    flash[:notice] = "保存しました"
    redirect_to addresses_path
  else
    @addresses = Address.all
    render :index
  end
end

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

def destroy
  @address = Address.find(params[:id])
  @address.destroy
  redirect_to addresses_path
end

private
  def address_params
    params.require(:address).permit(:name, :postal_code, :address)
  end


end
