class CartCreateJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "hy"
    
  end
end
