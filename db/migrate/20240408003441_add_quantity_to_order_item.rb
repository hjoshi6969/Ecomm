class AddQuantityToOrderItem < ActiveRecord::Migration[7.1]
  def change
    add_column :order_items, :Quantity, :integer
  end
end
