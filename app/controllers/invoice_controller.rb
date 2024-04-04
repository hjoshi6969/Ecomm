class InvoiceController < ApplicationController
    def index
      @email = params[:email]
      @address = params[:address]
      cart_hash = {}
  
      # Calculate total price and prepare cart hash
      total_price = 0
      session[:cart].each do |product_id, quantity|
        product = Product.find(product_id)
        price = product.sale ? product.price * 0.7 : product.price
        total_price += price * quantity
        cart_hash[product_id] = { quantity: quantity, price: price }
      end
  
      # Calculate taxes
      province = Province.find(Customer.find(current_customer.id).province_id)
      gst = total_price * (province.gst / 100)
      pst = total_price * (province.pst / 100)
      hst = total_price * (province.hst / 100)
  
      # Calculate total price including taxes
      total_with_taxes = total_price + gst + pst + hst
  
      # Create new order record
      order = Order.new(
        email: params[:email],
        address: params[:address],
        order_item: cart_hash,
        gst: gst,
        pst: pst,
        hst: hst,
        customer_id: current_customer.id,
      )
  
      # Save the order
      if order.save
        session.delete(:cart)
        redirect_to '/account'
      else
        # Handle errors
      end
    end
  end
  