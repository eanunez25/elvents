class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"

  has_many :event_attendings, foreign_key: :attended_event_id
  has_many :event_attendees, through: :event_attendings, source: :event_attendee

  def self.past
    filtered_events = []
    Event.all.each do |event|
      if event.date < Date.today
        filtered_events << event
      end
    end
    filtered_events
  end

  def self.upcoming
    filtered_events = []
    Event.all.each do |event|
      if event.date > Date.today
        filtered_events << event
      end
    end
    filtered_events
  end

end