class Profile < ApplicationRecord
  validates :first_name,  presence: true, length: { maximum: 25 }
  validates :last_name,  presence: true, length: { maximum: 50 }
  validates :phone_number,  presence: true
  validates :email_address,  presence: true, format: /\A\w+[\+\.\w-]*@([\w-]+\.)*\w+[\w-]*\.([a-z]{2,4}|\d+)\z/i 
  has_many :employers
end
