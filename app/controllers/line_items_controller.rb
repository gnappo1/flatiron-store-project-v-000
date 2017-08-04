class LineItemsController < ApplicationController

  def create
    current_user.create_current_cart unless current_user.current_cart
    line_item = current_user.current_cart.add_item(params[:item_id])
    if line_item.save
      redirect_to cart_path(current_user.current_cart), {notice: 'Item added to Cart'}
    else
      redirect_to root_path, {notice: 'Unable to add item to Cart'}
    end
  end

end
