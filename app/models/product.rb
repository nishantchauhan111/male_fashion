class Product < ApplicationRecord
  belongs_to :category
  has_many :order_products
  has_many :orders, through: :order_products
  has_many :carts
  has_many :users, through: :carts
  
  validates :name, presence: true
  validates :detail, presence: true
  validates :mrp, :discount, presence: true
  
  has_one_attached :image

  
end
