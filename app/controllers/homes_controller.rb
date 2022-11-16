class HomesController < ApplicationController
  
    def index
      @categories = Category.all
      @products = Product.all
      CartCreateJob.perform_later
    end
    
    def blog
    end

    def about
    end


  end
  