class HomesController < ApplicationController
  
    def index
      @categories = Category.all
      @products = Product.all
    end
    
    def blog
    end

    def about
    end


  end
  