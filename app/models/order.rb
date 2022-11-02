class Order < ApplicationRecord
  belongs_to :user

  validates :total, presence: true
  before_save :set_total

  def total 
    order_items.collect{|order_item| order_item.valid? ? order_items.unit_price*order_item.quantity : 0 }
  end



  private 

  def set_total
    self[:total] = total 
  end

end
