class Vote < ApplicationRecord
  validates :user, uniqueness: { scope: :post_id }
  belongs_to :user
  belongs_to :restaurant
end
