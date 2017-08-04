class DropCurrentCarts < ActiveRecord::Migration
  def change
    drop_table :current_carts
  end
end
