class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items
  has_many :current_carts

  def add_item(id)
    if line_item = line_items.find_by(item_id: id)
      line_item.update(quantity: line_item.quantity + 1)
      line_item
    else
      line_item.build(item_id: id)
    end
  end

  def total
    line_items.collect{|line_item| line_item.item.price * line_item.quantity}.sum
  end

end
