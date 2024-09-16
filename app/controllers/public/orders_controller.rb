class Public::OrdersController < ApplicationController
  def new
    @orders = Order.all
  end

  def thanks
  end

  def index
  end

  def show
  end
end
