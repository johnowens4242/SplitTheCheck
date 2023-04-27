class Favorite < ApplicationRecord
  validates :user, uniqueness: { scope: :restaurant }

  belongs_to :user
  belongs_to :restaurant
end
