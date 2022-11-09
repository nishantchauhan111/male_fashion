class CartsController < InheritedResources::Base
  before_action :authenticate_user!
  before_action :set_cart, only: %i[ update destroy ]

  def index
    @carts = current_user.carts
  end

  def create
    @cart = current_user.carts.create(product_id: params[:product_id])
    respond_to do |format|
      if @cart.save
        format.html { redirect_to carts_url, notice: "Cart was successfully created." }
      else
        format.html { redirect_to carts_url, notice: "Product already added as a cart" }
      end
    end
  end

  def update
    @cart.update(quantity: params[:quantity])
    respond_to do |format|
      format.html { redirect_to carts_url, notice: "Cart was successfully upadted." }
    end
  end

  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to carts_url, notice: "Cart was successfully destroyed." }
    end
  end

  private

  def set_cart
    @cart = current_user.carts.find_by(id: params[:id])
  end
end
