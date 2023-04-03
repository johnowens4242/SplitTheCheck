class Restaurant < ApplicationRecord
  validates :name, :location, :countWillSplit, :countWillNotSplit, presence: true
  validates_numericality_of :countWillSplit, :countWillNotSplit, :greater_than => -1
end
