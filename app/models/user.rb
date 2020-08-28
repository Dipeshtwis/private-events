class User < ApplicationRecord
  has_many :events, foreign_key: :creator_id, class_name: 'Event'
  validates :name, presence: true, uniqueness: { case_sensitive: false },
                   length: { minimum: 4, maximum: 25 }
end
