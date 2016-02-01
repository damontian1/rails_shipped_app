class Boat < ActiveRecord::Base
  validates :name, uniqueness: true
  belongs_to :user, dependent: :destroy
  has_many :jobs
  has_many :userfollowships
  has_many :followed_by, through: :userfollowships, source: :user
  has_attached_file :avatar, :styles =>
  { :medium => "300x300>", :thumb => "100x100>" },
  :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar,
  :content_type => /\Aimage\/.*\Z/
end
