class OrdersProductsController < InheritedResources::Base
  before_action :set_order_product, only: [:show, :edit, :update, :destroy]
      
  def index
    @order_product = OrdersProduct.all
  end
      
  def new
    @order_product = OrdersProduct.new
  end
      
  def create
    @order_product = OrdersProduct.new(order_product_params)
      respond_to do |format|
        if @order_products.save
           format.html { redirect_to @order_products, notice: 'OrderProduct was successfully created.' }
        else
          format.html { render :new }
        end
      end
  end
      
  def update
    respond_to do |format|
      if @order_products.update(orders_product_params)
        format.html { redirect_to @order_products, notice: 'OrderProduct was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end
      
  def destroy
    @order_products.destroy
    respond_to do |format|
      format.html { redirect_to order_products_url, notice: 'OrderProduct was successfully destroyed.' }
    end
  end
      
private

  def set_order_product
    @order_products = OrderProduct.find(params[:id])
  end
      
  def order_product_params
    params.require(:order_product).permit(:order_id, :product_id, :mrp, :discount)
  end
      
  end
      
    
end
