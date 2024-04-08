# app/admin/order.rb

ActiveAdmin.register Order do
    permit_params :order_item, :email, :gst, :pst, :hst, :address, :customer_id
  
    index do
      selectable_column
      id_column
      column :order_item
      column :email
      column :gst
      column :pst
      column :hst
      column :address
      column :customer_id
      column :created_at
      column :updated_at
      actions
    end
  
    form do |f|
      f.inputs "Order Details" do
        f.input :order_item
        f.input :email
        f.input :gst
        f.input :pst
        f.input :hst
        f.input :address
        f.input :customer_id
      end
      f.actions
    end
  end
  