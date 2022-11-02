class OrderItemsController < ApplicationController




    def create 
        @order = current_order
        @order_item = @order.order_items.new(order_params)
    end





    private 



    def order_params
        params.require(:order_item).permit(:product_id, :quantity)
    end
end
