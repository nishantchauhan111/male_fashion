class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :product
  
  validates :quantity, numericality: true, allow_blank: true
  validates :product_id, uniqueness: { scope: :user_id }
  

  before_save :set_quantity

  def set_quantity
    return if quantity.present?
  
    self.quantity = 1
  end

  def product_price
    quantity.to_i * product&.price 
  end

  def product_mrp
    quantity.to_i * product&.mrp
  end
 
end
