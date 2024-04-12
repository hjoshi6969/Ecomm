class OrderItem < ApplicationRecord
    # Associations
    belongs_to :order
    belongs_to :product
  
    # Validations
    validates :order_id, presence: true
    validates :product_id, presence: true
    validates :Quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  end
  