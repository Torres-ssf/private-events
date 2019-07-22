class User < ApplicationRecord
  has_many :events, foreign_key: :creator_id

  validates :name, presence: true, length: { maximum: 150 }
  validates :email, presence: true, length: { maximum: 255 }
  
end
