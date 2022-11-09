class Category < ApplicationRecord
    has_one :product
    
    validates :name, presence: true
    
    has_one_attached :image
  
    scope :published, ->{ where.not(published_at: nil) }
    scope :unpublished, ->{ where(published_at: nil) }
  end
  