class User < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false },
                   length: { minimum: 4, maximum: 25 }
end
