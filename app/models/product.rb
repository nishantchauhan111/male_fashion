class Product < ApplicationRecord
  has_many :order_items
  belongs_to :category, dependent: :destroy
  has_one_attached :image



  validates :name, presence: true
  validates :price, presence: true 
end
