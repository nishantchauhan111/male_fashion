class ProductsController < ApplicationController
    
  def index
      @products = Product.all
      @categories = Category.all
  end

def show
  @product  = Product.find(params[:id])
end

def create
  @product = Product.new(products_params)

  respond_to do |format|
    if @product.save
      format.html { redirect_to products_url(@product), notice: "products was successfully created." }
    else
      format.html { render :new, status: :unprocessable_entity }
    end
  end
end
end