class Order < ApplicationRecord
  belongs_to :user
  has_many :order_products
  has_many :products, through: :order_products
  
  validates :date, presence: true
  validates :subtotal, :discount, :total, presence: true
  validates :payment_mode, :payment_id, :status, presence: true
  
end
