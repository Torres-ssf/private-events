# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :user, foreign_key: :creator_id
  has_many :people_attending, foreign_key: 'attended_event_id',
                              class_name: 'Attendance'
  has_many :attendees, through: :people_attending

  validates :name, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :time, presence: true

  class << self
    def past
      where('time < ?', Time.now)
    end

    def upcoming
      where('time >= ?', Time.now)
    end
  end
end
