class User < ApplicationRecord
  has_many :events, foreign_key: :creator_id
  has_many :attended, foreign_key: 'attendee_id', class_name: 'Attendance'
  has_many :attended_events, through: :attended

  validates :name, presence: true, length: { maximum: 150 }
  validates :email, presence: true, length: { maximum: 255 }

end
