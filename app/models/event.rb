class Event < ApplicationRecord
  validates :name, presence: true, length: { in: 1..50 }
  validates :description, presence: true, length: { in: 1..200 }
  validates :date, presence: true

  belongs_to :creator, class_name: "User"
  has_many :event_attendings, foreign_key: :attended_event_id, dependent: :destroy
  has_many :attendees, through: :event_attendings

  scope :past, -> { where("date < ?", Date.current) }
  scope :upcoming, -> { where("date >= ?", Date.current) }
end
