class User < ApplicationRecord
    has_many :orders 


    validates :name, presence: true
    validates :address, length: { minimum: 10}
    validates :pincode, numericality: true

end
