class Order < ApplicationRecord
  # Associations
  belongs_to :customer

  # Validations
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :gst, :hst, :pst, numericality: { greater_than_or_equal_to: 0 }
  validates :address, presence: true

  def self.ransackable_associations(auth_object = nil)
    ["customer"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["address", "created_at", "customer_id", "email", "gst", "hst", "id", "id_value", "order_item", "pst", "updated_at"]
  end
end
dsad