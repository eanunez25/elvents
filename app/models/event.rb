class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"

  has_many :event_attendings, foreign_key: :attended_event_id
  has_many :event_attendees, through: :event_attendings, source: :event_attendee

  scope :past, -> { where('DATE(date) <= ?', Date.today) }
  scope :today, -> { where('DATE(date) = ? ', Date.today) }
  scope :upcoming, -> { where('DATE(date) > ?', Date.today) }

end