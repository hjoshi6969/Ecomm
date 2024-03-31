class Category < ApplicationRecord
    has_many :products, dependent: :delete_all
    def self.ransackable_attributes(auth_object = nil)
        column_names
      end
end