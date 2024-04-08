class Order < ApplicationRecord
  belongs_to :customer
  def self.ransackable_associations(auth_object = nil)
    ["customer"]
  end
  def self.ransackable_attributes(auth_object = nil)
    ["address", "created_at", "customer_id", "email", "gst", "hst", "id", "id_value", "order_item", "pst", "updated_at"]
  end
end
