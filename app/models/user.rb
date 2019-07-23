# frozen_string_literal: true

class User < ApplicationRecord
  has_many :events, foreign_key: :creator_id
  has_many :attended, foreign_key: 'attendee_id', class_name: 'Attendance'
  has_many :attended_events, through: :attended

  validates :name, presence: true, length: { maximum: 150 }
  validates :email, presence: true, length: { maximum: 255 }

  # scope :upcoming_events, -> { attended_events.where('time >= ?', Time.now) }
  # scope :previous_events, -> { attended_events.where('time < ?', Time.now) }

  def upcoming_events
    attended_events.where('time >= ?', Time.now)
  end

  def previous_events
    attended_events.where('time < ?', Time.now)
  end
end
