class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :product, dependent: :destroy

 def create 
  
 end

end
