class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :invitations, foreign_key: :attended_event_id
  has_many :attendees, through: :invitations, source: :attendee

  validates :name, :description, :location, :date, presence: true

  scope :past, -> { where(['date < ?', Date.today]) }
  scope :upcoming, -> { where(['date > ?', Date.today]) }
end
