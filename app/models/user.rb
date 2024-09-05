class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { in: 1..30 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, foreign_key: "creator_id", class_name: "Event", dependent: :destroy
  has_many :event_attendings, foreign_key: :attendee_id
  has_many :attended_events, through: :event_attendings
end
