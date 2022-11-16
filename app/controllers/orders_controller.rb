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
    @order.total = total
 
    respond_to do |format|
      if @order.save  
        current_user.carts.each do |cart|
          @order.orders_product.create(
            product_id: cart.product.id,
            name: cart.product.name,
            quantity: cart.quantity,
            total: cart.product_price
          )
          cart.delete
        end
        
        OrderMailer.user_email(current_user).deliver_now
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
    params.require(:order).permit(:user_id, :total, :product_id, :name, :quantity, :mrp, )
  end

end
