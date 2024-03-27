class ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).per(10)
  end

  def show
    @product = Product.find(params[:id])
  end

  def cart
    session[:cart] ||= []
    product_id = params[:product_id].to_i
    session[:cart] << product_id unless session[:cart].include?(product_id)
    @products = Product.find(session[:cart])
  end

  def cartRemove
    product_id = params[:product_id].to_i
    session[:cart].delete(product_id)
    redirect_back(fallback_location: root_path)
  end 
end
