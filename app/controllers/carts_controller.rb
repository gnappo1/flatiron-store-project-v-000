class CartsController < ApplicationController
  before_action :set_cart

  def show
  end

  def checkout
    @cart.checkout
    redirect_to @cart
  end

  private

  def set_cart
    @cart = Cart.find_by(id: params[:id])
  end
end
