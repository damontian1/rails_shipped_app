class Boat < ActiveRecord::Base
  belongs_to :user
  has_many :jobs
  has_many :userfollowships
  has_many :followed_by, through: :userfollowships, source: :user
end
