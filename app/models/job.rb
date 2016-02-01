class Job < ActiveRecord::Base
  validates :name, uniqueness: true
  belongs_to :boat, dependent: :destroy
  validates :cargo, length: {in: 50..10000}
  validates_numericality_of :cost, :greater_than => 1000, :less_than => 100000000
end
