class OrderProductsController < InheritedResources::Base

  before_action :set_order_product, only: [:show, :edit, :update, :destroy]

  def index
    @order_products = OrderProduct.all
  end

  def show
  end

  def new
    @order_product = OrderProduct.new
  end

  def edit
  end

  def create
    @order_product = OrderProduct.new(order_product_params)

    respond_to do |format|
      if @order_product.save
        format.html { redirect_to @order_product, notice: 'OrderProduct was successfully created.' }
        format.json { render :show, status: :created, location: @order_product }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @order_product.update(order_product_params)
        format.html { redirect_to @order_product, notice: 'OrderProduct was successfully updated.' }
        format.json { render :show, status: :ok, location: @order_product }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @order_product.destroy
    respond_to do |format|
      format.html { redirect_to order_products_url, notice: 'OrderProduct was successfully destroyed.' }
    end
  end

  private
  def set_order_product
    @order_product = OrderProduct.find(params[:id])
  end

  private
  def order_product_params
    params.require(:order_product).permit(:order_id, :product_id, :mrp, :discount, :total)
  end

end
