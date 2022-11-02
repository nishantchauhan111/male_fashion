class CartsController < ApplicationController
    before_action :authenticate_user!
    def index
        @carts = Cart.all
    end

end
