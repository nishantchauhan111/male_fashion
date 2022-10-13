class Product < ApplicationRecord
  
  belongs_to :category, dependent: :destroy
  has_many_attached :images



  validates :name, presence: true
  validates :price, presence: true 
end
