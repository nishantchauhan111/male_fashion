class OrdersController < InheritedResources::Base
  before_action :authenticate_user!
  before_action :set_order, only: %i[ show edit update destroy ]

  def index
    @order = Order.new
    @carts = Cart.all
    @users = User.all
  end

  def new
    @order = Order.new
  end

  def create
    @order = current_user.orders.new(order_params)
    @order.date = Date.today

    total = 0
    mrp = 0
    current_user.carts.each do |cart|
      total = total + cart.product_price
      mrp = mrp + cart.product_mrp
    end
    @order.subtotal = mrp
    @order.total = total
    @order.status = "Pending"      
 
    respond_to do |format|
      if @order.save  
        current_user.carts.each do |cart|
          @order.order_products.create(
            product_id: cart.product.id,
            name: cart.product.name,
            quantity: cart.quantity,
            mrp: cart.product_mrp,
            total: cart.product_price
          )
          cart.delete
        end
        
        OrderMailer.customer_email(current_customer).deliver_now
        format.html { redirect_to order_url(@order), notice: "Order was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    respond_to do |format|
      format.html { redirect_to order_url, notice: "Order was successfully destroyed." }
    end
  end

  private
  def set_order
    @order = Order.find_by(id: params[:id])
  end

  def order_params
    params.require(:order).permit(:payment_mode, :payment_id)
  end

end
