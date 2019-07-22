# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :user, foreign_key: :creator_id

  validates :name, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :time, presence: true
end
