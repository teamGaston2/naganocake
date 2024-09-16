class Public::OrdersController < ApplicationController
  def new
    @orders = Order.find(params[:id])
  end

  def thanks
  end

  def index
  end

  def show
  end
end
