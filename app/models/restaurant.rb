class Restaurant < ApplicationRecord
  after_initialize :set_defaults

  def set_defaults
    countWillSplit = 0
    countWillNotSplit = 0
  end

  # :countWillSplit, :countWillNotSplit,
  validates :name, :location, presence: true
  #validates_numericality_of :countWillSplit, :countWillNotSplit, :greater_than => -1
  has_many :votes
end
