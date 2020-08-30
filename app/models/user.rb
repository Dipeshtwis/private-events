class User < ApplicationRecord
  has_many :events, foreign_key: :creator_id, class_name: 'Event'
  has_many :invitations, foreign_key: :attendee
  has_many :attended_events, through: :invitations, source: :attended_event

  validates :name, presence: true, uniqueness: { case_sensitive: false },
                   length: { minimum: 4, maximum: 25 }

  scope :past, -> { where(['date < ?', Date.today]) }
  scope :upcoming, -> { where(['date > ?', Date.today]) }
end
