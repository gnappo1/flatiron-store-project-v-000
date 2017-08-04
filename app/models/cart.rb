class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items
  enum status: [:submitted, :current]

  def add_item(id)
    if line_item = line_items.find_by(item_id: id)
      line_item.update(quantity: line_item.quantity += 1)
      line_item
    else
      line_items.build(item_id: id)
    end
  end

  def total
    line_items.collect{|line_item| line_item.item.price * line_item.quantity}.sum
  end

  def checkout
    line_items.each do |line_item|
      line_item.item.update_inventory(line_item.quantity)
    end
    user.destroy_cart
    update(status: 'submitted')
  end

end
