class CartCreateJob < ApplicationJob
  queue_as :default

  def perform(*args)
    
end
