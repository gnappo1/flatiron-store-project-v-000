class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :carts
  has_one :current_cart

  def current_cart=(cart)
    if cart.nil? && current_cart
      CurrentCart.destroy(current_cart.id)
    elsif cart.nil?
      CurrentCart.create(user_id: current_user.id, cart_id: cart.id)
    end
  end

  def current_cart
    cart_id = CurrentCart.where(user_id: self.id)
    Cart.find_by(id: cart_id)
  end

end
