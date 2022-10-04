class Product < ApplicationRecord
  
  belongs_to :category, dependent: :destroy



  validates :name, presence: true
  validates :price, presence: true 
end
